class Admins::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @itemnew = Item.new
  end

  def create
    @item = Item.new(items_params)
    @item.save
    redirect_to edit_admins_item
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(items_params)
    redirect_to item_path
  end

  private
  def items_params
    params.require(:item).permit(:name, :explanation, :excluded, :image, :status, :type_id)
end

end

