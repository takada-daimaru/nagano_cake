class CartItemsController < ApplicationController
  def index
    @cartitems = CartItem.all
  end


  def create
    
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.item_id = params[:item_id]
    @cart_item.customer_id = current_customer.id
    @cart_item.save!
    redirect_to customers_cart_items_path
  end

  def update
    
  end

  def destroy
    
  end

  def all_delete

  end
  
  private

  def cart_item_params
    params.require(:cart_item).permit(:quontity )
  end


end
