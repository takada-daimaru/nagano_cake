class CartItemsController < ApplicationController
  def index
    if current_cart_item = ""
    @cart = CartItem.item.all
    else
    @cart_items = current_cart_item.item
  end

  end

  def create
    if @cart_item.blank?
       @cart_item = CartItem.new(item_id: params[:item_id])
    end

    @cart_item.quontity = params[:quontity].to_i
    @cart_item.save
    redirect_to customers_cart_items_path
  end

  def update
    
  end

  def destroy
    
  end

  def all_delete

  end
  
  private

  def setup_cart_item!
    @cart_item = current_cart_item.cart_items.find_by(item_id: params[:item_id])
  end
  def cart_item_params
    params.require(:cart_item).permit(:item_id,:quontity,:current_customer_id,)
  end


end
