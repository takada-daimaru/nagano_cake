class CartItemsController < ApplicationController
  def index
    @cartitems = CartItem.all

  end


  def create
    
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.item_id = params[:item_id]
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to customers_cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    if @cart_item.quontity = 0
      @cart_item.destroy
      redirect_to customers_cart_items_path
    else
    redirect_to customers_cart_items_path
  end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to customers_cart_items_path
    
  end

  def all_delete
    @cart_item = CartItem.all
    @cart_item.destroy_all
    redirect_to items_path

  end
  
  private

  def cart_item_params
    params.require(:cart_item).permit(:quontity )
  end


end
