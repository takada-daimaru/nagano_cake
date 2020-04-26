class ShippingsController < ApplicationController

def index
    @shippings = Shipping.all
    @shipping = Shipping.new
end

def create
    @shipping = Shipping.new(shipping_params)
    @shipping.customer_id = current_customer.id
    if @shipping.save
    redirect_to shippings_path
    else
    @shippings = Shipping.all
    render :template =>'shippings/index'
    end
  end

  def destroy
    @shipping = Shipping.find(params[:id])
    @shipping.destroy
    redirect_to shippings_path
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end

  def update
    @shipping = Shipping.find(params[:id])
    if @shipping.update(shipping_params)
       flash[:notice] = '情報を更新しました。'
       redirect_to shippings_path
    else
      render 'edit'
    end
  end



  private
  def shipping_params
      params.require(:shipping).permit(:postcode, :address, :name)
  end

end
