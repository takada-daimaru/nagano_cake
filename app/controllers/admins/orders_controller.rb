class Admins::OrdersController < ApplicationController
  def top
  	now = Time.current
  	@order_count = Order.where(created_at: Date.today).count
  end

  def show
  	@order = Order.find(params[:id])
  end

  def update
  end

  def history
  	@orders = Order.all
  end
end
