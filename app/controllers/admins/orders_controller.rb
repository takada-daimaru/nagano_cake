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
    @order.update(order_params)

   if @order.status == "入金確認"

     @order.order_items.each do |order|
     order.update(status: "製作待ち") 
     end
     redirect_to admins_orders_path

    else
    redirect_to admins_orders_path
    end
  end

  def history
  	@orders = Order.all
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end


end

