class UsersController < ApplicationController
  def edit
  end

  def update
    user = User.find(params[:id])
    if user.id == current_user.id
      user.update(user_params)
      redirect_to root_path
    end
  end

  def show
    @prototypes = current_user.prototypes.page(params[:page])
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
