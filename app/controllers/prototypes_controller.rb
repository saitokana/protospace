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
    @captured_images = @prototype.captured_images
  end

  def show
    @prototype = Prototype.find(params[:id])
    @user = @prototype.user
  end

  def update
    @prototype = Prototype.find(params[:id])
    @prototype.update(prototype_params)
    @prototype.update_captured_images(update_images_params)
    redirect_to :root
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to :root
  end

  private
  def prototype_params
    params.require(:prototype).permit(:catch_copy, :concept, :title).merge(user_id: current_user.id)
  end

  def images_params
    params.require(:prototype).require(:captured_images_attributes).require("0")
  end

  def update_images_params
    params.require(:prototype).require(:captured_images_attributes)
  end


end
