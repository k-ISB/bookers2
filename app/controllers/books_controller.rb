class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :destroy]

  def index
    @user = User.find(current_user.id)
    @book = Book.new
  	@books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @book2 = Book.new
    @user2 = User.find(current_user.id)
  end

  def create
    user = current_user
    @book = user.books.new(book_params)
    if @book.save
      flash[:success] = "You have creatad book successfully."
      redirect_to book_path(@book.id)
    else
      @user = User.find(current_user.id)
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

    def book_params
      params.require(:book).permit(:title, :body)
    end

    def correct_user
      @book = Book.find(params[:id])
      redirect_to books_path unless @book.user_id == current_user.id
    end
end
