class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    render :edit
    else
      redirect_to books_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def index
    @users = User.all
    @user = current_user
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.all
  end





  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)

  end


end
