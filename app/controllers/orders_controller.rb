class OrdersController < ApplicationController

  def index
    @orders = Order.all

  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @ordernew = Order.new
  end

  def confirm
    @ordernew = Order.new(order_params)
    
    # newページのdelivery_typeの値により保存する情報を変更
    case params[:delivery_type]
      when "ご自身の住所"
        @ordernew.postcode = current_customer.postcode
        @ordernew.address = current_customer.address
        @ordernew.destination = current_customer.last_name

      when "登録済住所から選択"
        @ordernew.postcode = Shipping.find(shipping_params[:id]).postcode
        @ordernew.address = Shipping.find(shipping_params[:id]).address
        @ordernew.destination = Shipping.find(shipping_params[:id]).name

      when "新しいお届け先"
    
    end
  end

  def create
    @ordernew = current_customer.orders.new
    if @order.save!
      current_customer.cart_items.each do |cart_item|
        # 注文商品テーブルにレコードを追加する
        @order_items = OrderItem.new(
          order_id: @order.id,
          item_id: cart_item.item_id,
          status: @order.order_item.status,
          quontity: cart_item.quontity,
          price: cart_item.item.excluded,
        )

        @order_items.save!
      end
      Delivery.create!(customer_id: current_customer.id, postcode: @order.postcode, address: @order.address, name: @order.destination)
      
      current_customer.cart_items.delete_all
      # 顧客のカート内をデリートしてターンエンド
    end
    redirect_to thanks_orders_path
  end

  def thanks
    
  end

  private

    def order_params
      params.require(:order).permit(:customer_id, :shipping_cost, :payment, :status, :postcode, :address, :destination, :invoice)
    end

    def shipping_params
      params.require(:order).require(:shipping).permit(:id)
    end

end
