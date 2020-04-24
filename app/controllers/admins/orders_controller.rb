class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def top
  	now = Time.current
  	@order_count = Order.where("Date(created_at) = '#{Date.today}'").count
  end

  def show
  	@order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @orderitems = @order.order_items
    @order.update(order_params)

    if @order.status == "入金確認"

     @orderitems.update(status: "製作待ち") 
     redirect_back(fallback_location:root_path)
   else
     redirect_back(fallback_location:root_path)
  end
  end

  def history
  	@orders = Order.all
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end

  def item_params
    params.require(:order_item).permit(:status)
  end


end

