class Prototypes::CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    @prototype = Prototype.find(params[:prototype_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
