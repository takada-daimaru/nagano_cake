class Admins::OrdersController < ApplicationController
  def top
  end

  def show
  end

  def update
  end

  def history
  	@orders = Order.all
  end
end
