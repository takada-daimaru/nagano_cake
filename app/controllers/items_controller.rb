class ItemsController < ApplicationController
  def index
       @types = Type.all
       @items = Item.all

  end

  def show
    
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
