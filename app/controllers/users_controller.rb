class UsersController < ApplicationController
  before_action :authenticate

  def index
    @users = User.all
    @user = User.find(current_user.id)
    @book = Book.new
    @book.user_id = @user.id
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @book.user_id = @user.id
    @books = @user.books.all
  end

  def create
    user = current_user
    book = user.books.new(book_params)
    book.save
    flash[:success] = "Welcome! You have signed up successfully."
    redirect_to book_path(book)
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
    flash[:success] = "You have updated user successfully."
  	redirect_to user_path(@user.id)
  end

  private

    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end

    def book_params
      params.require(:book).permit(:title, :body)
    end

    def authenticate
      redirect_to new_user_session_url unless user_signed_in?
    end
end
