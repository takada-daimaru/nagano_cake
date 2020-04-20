class AdminsController < ApplicationController
    protected

	def not_authenticated
      redirect_to "/admins/login"
    end
end
