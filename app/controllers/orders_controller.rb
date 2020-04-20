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
    @order = Order.new(order_params)
    
    # newページのdelivery_typeの値により保存する情報を変更
    case params[:delivery_type]
      when "ご自身の住所"
        @order.postcode = current_customer.postcode
        @order.address = current_customer.address
        @order.destination = current_customer.name

      when "登録済住所から選択"
        @order.postcode = Shipping.find(shipping_params[:id]).postcode
        @order.address = Shipping.find(shipping_params[:id]).address
        @order.destination = Shipping.find(shipping_params[:id]).name

      when "新しいお届け先"
    
    end
  end

  def create
    @order = current_customer.orders.new(order_params)
    if @order.save!
      current_customer.cart_items.each do |cart_item|
        # 注文商品テーブルにレコードを追加する
        @order_items = OrderItem.new(
          order_id: @order.id,
          item_id: cart_item.item_id,
          # status: 
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
