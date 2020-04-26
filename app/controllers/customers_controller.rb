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
    if @customer.update(customer_params)
      flash[:notice] = '情報を更新しました。'
    redirect_to customers_path
    else
      render 'edit'
    end
  end

  def passwordsupdate
    @customer = current_customer
    if @customer.update(password_params)
      flash[:notice] = 'パスワードを変更しました。'
    redirect_to root_path
    else
      flash[:notice] =  'パスワードが変更できませんでした。'
    redirect_back(fallback_location:root_path)
    end
  end

  def status
    @customer = current_customer
  end


  def update_status
    @customer = current_customer
    if @customer.status == "有効"
      @customer.status = "退会済み";
      @customer.save
      reset_session
      redirect_to root_path
    end
  end

  private
  def customer_params
      params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email ,:postcode, :address, :phone_number )
  end

  def password_params
      params.require(:customer).permit(:password, :password_confirmation,:current_password )
  end

  def update_params
    params.require(:customer).permit(:status)
  end

  
end
