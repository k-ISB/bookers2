class UsersController < ApplicationController
  before_action :authenticate
  before_action :correct_user?, only: [:edit]

  def index
    @users = User.all
    @user = current_user
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
  	if @user.update(user_params)
      flash[:success] = "You have updated user successfully."
  	  redirect_to user_path(@user.id)
    else
      render :edit
    end
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

    def correct_user?
      user = User.find(params[:id])
      redirect_to user_path(current_user.id) unless user == current_user
    end
end
