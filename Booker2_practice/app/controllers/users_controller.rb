class UsersController < ApplicationController
  def index
  	@user = current_user
  	@book_new = Book.new
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  	@book_new = Book.new
  	@books = @user.books
  end

  def edit
  	@user = User.find(params[:id])
  	if current_user.id != @user.id
  		redirect_to user_path(current_user)
  	end
  end
end
