class ItemsController < ApplicationController
  def index
     @types = Type.where(status: "有効" )
       if params[:types_id] == nil
        @count = Item.where(status: "販売中").count
        @item = Item.where(status: "販売中")
        @items = @item.page(params[:page]).reverse_order
      else
         @type = Type.find(params[:types_id])
         @item = @type.items
         @count = @item.where(status: "販売中").count
         @item = Item.where(status: "販売中")
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
      @types = Type.where(status: "有効")
      @items = Item.where(status:"販売中")
  end

  def about
  end

  private
  
end
