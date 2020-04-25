class ItemsController < ApplicationController
  def index
    if params[:types_id] == nil
      @items = Item.page(params[:page]).reverse_order
      @types = Type.all
    else
       @type = Type.find(params[:types_id])
       @types = Type.all
       @item = @type.items
       @items = @item.page(params[:page]).reverse_order
    end
  end

  def show
    @customer = current_customer
    @cartitemnew = CartItem.new
    @types = Type.all
    @item = Item.find(params[:id])
  end

  def new

  end

  def create

  end

  def top
      @types = Type.all
      @items = Item.all

      @rank_items = Item.find(OrderItem.group(:item_id).order('count(item_id) desc').limit(4).pluck(:item_id))
  end

  def about
  end

  private
  
end
