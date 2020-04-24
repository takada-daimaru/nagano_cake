class Admins::OrderItemsController < ApplicationController

	def update
		@orderitem = OrderItem.find(params[:id])
		@orderitemall =OrderItem.where(order_id: @order_id)
		@order = @orderitem.order
		@orderitem.update(status_params)

		if @orderitem.status == "製作中"
		   @order.update(status: "製作中")
		else
		redirect_to admins_orders_path
	end	
	end

	private
	def status_params
		params.require(:order_item).permit(:status)
    end

end