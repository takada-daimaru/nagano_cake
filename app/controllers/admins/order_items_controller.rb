class Admins::OrderItemsController < ApplicationController

	def update
		@orderitem = OrderItem.find(params[:id])
		@order = @orderitem.order
		@orderitem.update(status_params)
		if @orderitem.status == "製作中"
		   @order.update(status: "製作中") 
		  redirect_back(fallback_location:root_path)

	   elsif 
	   	


		 redirect_back(fallback_location:root_path)
	end
end

	private
	def status_params
		params.require(:order_item).permit(:status)
    end

end
