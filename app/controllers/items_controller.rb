class ItemsController < ApplicationController
  def index
       @types = Type.all
       @type = 
       @items = Item.page(params[:page]).reverse_order

  end

  def show
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

  end

  def about
    
  end

  private
  
end
