class Admins::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if@item.save
    redirect_to admins_items_path
    else
      render 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
       flash[:notice] = '商品情報を更新しました。'
       redirect_to admins_item_path
    else
      render 'edit'
    end
  end

  private
  def items_params
    params.require(:item).permit(:name, :explanation, :excluded, :image, :status, :type_id)

  end

end

