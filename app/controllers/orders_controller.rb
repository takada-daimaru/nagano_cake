class OrdersController < ApplicationController

  def index
    @orders = Order.all

  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @ordernew = Order.new
    @shippings = Shipping.all
  end

  def confirm
    @ordernew = Order.new(order_params)
    # newページのdelivery_typeの値により保存する情報を変更
    case params[:delivery_type]
      when "ご自身の住所"
        @ordernew.postcode = current_customer.postcode
        @ordernew.address = current_customer.address
        @ordernew.destination = current_customer.first_name + current_customer.last_name
      when "登録済住所から選択"
        @ordernew.postcode = Shipping.find(shipping_params[:id]).postcode
        @ordernew.address = Shipping.find(shipping_params[:id]).address
        @ordernew.destination = Shipping.find(shipping_params[:id]).name

      when "新しいお届け先"
    
    end
  end

  def create
    @ordernew = Order.new(order_params)
    @ordernew.customer_id = current_customer.id
    if @ordernew.save
      current_customer.cart_items.each do |cart_item|
        # 注文商品テーブルにレコードを追加する
        @order_items = OrderItem.new(
          order_id: @ordernew.id,
          item_id: cart_item.item_id,
          quontity: cart_item.quontity,
          price: cart_item.item.excluded,
          )
        
        @order_items.save
      end
      Shipping.create(customer_id: current_customer.id, postcode: @ordernew.postcode, address: @ordernew.address, name: @ordernew.destination)
      
      current_customer.cart_items.delete_all
      # 顧客のカート内をデリートしてターンエンド
      redirect_to orders_thanks_path
    else
      redirect_to new_order_path
      flash[:notice] = '配送先を指定してください'
    end
    
  end

  def thanks
    
  end

  private

    def order_params
      params.require(:order).permit(:customer_id, :shipping_cost, :payment, :status, :postcode, :address, :destination, :invoice)
    end

    def shipping_params
      params.require(:order).permit(:id)
    end

end
