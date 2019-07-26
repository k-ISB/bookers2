class BooksController < ApplicationController
  before_action :signed_in?
  before_action :correct_user?, only: [:edit, :update, :destroy]

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @book.user_id = @user.id
  	@books = Book.all
  end

  def show
    @book2 = Book.find(params[:id])
    @user2 = User.find(@book2.user_id)
    @user = User.find(current_user.id)
    @book = Book.new
    @book.user_id = @user.id
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

    def signed_in?
      redirect_to new_user_session_url unless user_signed_in?
    end

    def correct_user?
      @book = Book.find(params[:id])
      redirect_to books_path unless @book.user_id == current_user.id
    end
end
