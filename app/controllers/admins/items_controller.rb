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
  end

  def edit
    @item = Item.new
    @items = Item.all
  end

  def update
    @item = Item.find(params[:id])
    @item = update (item_parems)
    redirect_to item_path
  end

  def items_params
    params.require(:item).permit(:name, :explanation, :excluded, :image, :status)
end

end


<
