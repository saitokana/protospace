class PrototypesController < ApplicationController

  before_action :set_prototype, only: [:show, :edit, :update]

  def index
    @prototypes = Prototype.all.page(params[:page])
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
      @prototype.create_captured_images(images_params)
      redirect_to :root, success: '新しくprototypeを作成しました'
    else
      redirect_to :back, success: '入力が不十分です'
    end
  end

  def edit
    @captured_images = @prototype.captured_images
  end

  def show
    @like = Like.where(prototype_id: params[:id]).first_or_initialize
    @comment = Comment.new
  end

  def update
    @prototype.update(prototype_params)
    @prototype.update_captured_images(update_images_params)
    redirect_to :root, success: '更新しました'
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to :root, success: '削除しました'
  end

  private
  def prototype_params
    params.require(:prototype).permit(:catch_copy, :concept, :title).merge(user_id: current_user.id, tag_list: params[:prototype][:tags].values)
  end

  def images_params
    params.require(:prototype).require(:captured_images_attributes).require('0')
  end

  def update_images_params
    params.require(:prototype).require(:captured_images_attributes)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

def tags_params
  params.require(:prototype).require(:tags).values
end

end
