class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	helper_method :current_cart_item

	def current_cart_item
		if session[:customer_id]
			@cart = CartItem.find(session[:costemer_id])
		else
			@cart = CartItem.create
			session[:customer_id] = @cart.id
		end
	end
end
