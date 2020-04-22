class Admins::OrdersController < ApplicationController
  def top
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
