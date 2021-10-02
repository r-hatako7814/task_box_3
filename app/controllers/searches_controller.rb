class SearchesController < ApplicationController

  def search
    @range = params[:range]
    search = params[:search]
    word = params[:word]
    @user = User.search(search,word)
    @book = Book.search(search,word)
  end

end
