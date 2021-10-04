class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.book_comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
  end


  def destroy
    @book = Book.find(params[:book_id])
    @comment = BookComment.find(params[:id])
    @comment.destroy
  end


private

  def comment_params
    params.require(:book_comment).permit(:comment, :book_id, :user_id)
  end


end
