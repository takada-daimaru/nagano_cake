class Admins::OrderItemsController < ApplicationController

	def update
		@orderitem = OrderItem.find(params[:id])
		@order = @orderitem.order
		@orderitemall = @order.order_items
		@orderitem.update(status_params)
		if @orderitem.status == "製作中"
		   @order.update(status: "製作中") 
		  redirect_back(fallback_location:root_path)


	   elsif @orderitemall.where(status: "製作完了").count == @orderitemall.count 
	   		 @order.update(status: "発送準備中")
	   	     redirect_back(fallback_location:root_path)

	   	else
			 redirect_back(fallback_location:root_path)

	end
end

	private
	def status_params
		params.require(:order_item).permit(:status)
    end

end
