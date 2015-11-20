class Prototypes::LikesController < ApplicationController
  def create
    @like = current_user.likes.create(prototype_id: params[:prototype_id])
    @prototype = Prototype.find(params[:prototype_id])
  end

  def destroy
    Like.find_by(user_id: current_user.id, prototype_id: params[:prototype_id]).destroy
    # @likes = Like.where(prototype_id: params[:prototype_id])
    @prototype = Prototype.find(params[:prototype_id])
  end
end
