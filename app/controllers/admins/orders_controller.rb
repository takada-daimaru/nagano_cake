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
    redirect_to admins_orders_path
  end

  def history
  	@orders = Order.all
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
