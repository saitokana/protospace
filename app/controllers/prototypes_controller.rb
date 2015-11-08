class PrototypesController < ApplicationController

  def index
    @prototypes = Prototype.all.page(params[:page]).per(8)
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.create(prototype_params)
    redirect_to :root and return
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
    params.require(:prototype).permit(:catch_copy, :concept, :title, captured_images_attributes: [:id, :name,:role]).merge(user_id: current_user.id)
  end

end
