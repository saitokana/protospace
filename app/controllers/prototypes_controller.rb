class PrototypesController < ApplicationController

  def index
    @prototypes = Prototype.all.page(params[:page])
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.create(prototype_params)
    @prototype.create_captured_images(images_params)
    redirect_to :root
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def show
    @prototype = Prototype.find(params[:id])
    @user = prototype.user
  end

  private
  def prototype_params
    params.require(:prototype).permit(:catch_copy, :concept, :title).merge(user_id: current_user.id)
  end

  def images_params
    params.require(:prototype).require(:captured_images_attributes).require("0")
  end

end
