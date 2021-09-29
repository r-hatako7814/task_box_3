class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    render :edit
    else
      redirect_to user_path(current_user)
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
    @book = Book.new
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.all
    # @posts = @user.posts.page(params[:page]).reverse_order
    # @following_users = @user.following_user
    # @follower_users = @user.follower_user
  end

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end





  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)

  end


end
