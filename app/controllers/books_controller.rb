class BooksController < ApplicationController
  def index
  	@books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  def create
    user = current_user
    book = user.books.new(book_params)
    book.save
    redirect_to book_path(book)
  end

  def edit
  	@user = User.find(params[:id])
  end

  private

    def book_params
      params.require(:book).permit(:title, :body)
    end
end
