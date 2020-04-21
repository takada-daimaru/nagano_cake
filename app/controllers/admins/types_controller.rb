class Admins::TypesController < ApplicationController
  def index

  	@types = Type.all
  	@typenew = Type.new

  end

  def create
  	@typenew = Type.new(type_params)
  	@typenew.save
  	redirect_to admins_types_path
  end

  def edit
  	@type = Type.find(params[:id])
  end

  def update
  	@type = Type.find(params[:id])
  	@type.update(type_params)
  	redirect_to admins_types_path
  end
  private
  	def type_params
		params.require(:type).permit(:name, :status)
	end
end
