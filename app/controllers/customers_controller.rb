class CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
    
  end

  def passwords
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_path
  end

  def passwordsupdate
    @customer = current_customer
    @customer.update(password_params)
    redirect_to root_path
  end

  def update_
  end

private
def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email ,:postcode, :address, :phone_number )
end

def password_params
    params.require(:customer).permit(:password, :password_confirmation,:current_password )
end

  
end
