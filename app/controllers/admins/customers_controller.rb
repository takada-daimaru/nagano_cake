class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@customers = Customer.all
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
	@customer = Customer.find(params[:id])
		if @customer.update(customer_params)
			flash[:notice] = "変更しました"
			redirect_to admins_customer_path(@customer.id)
		else
			@customer = Customer.find(params[:id])
		render :edit
		end
  end
end
