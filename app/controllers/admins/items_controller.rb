class Admins::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
  end

  def new
    @itemnew = Item.new
  end

  def create
  end

  def edit
  end

  def update
  end

end
