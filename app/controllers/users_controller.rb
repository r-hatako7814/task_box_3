class UsersController < ApplicationController

  def edit
    @user=current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to books_path
  end

  def index
    @users = User.all
    @user = current_user
  end

  def show

  end





  private

  def user_params
    params.require(:user).permit(:name,:profile_image)

  end


end
