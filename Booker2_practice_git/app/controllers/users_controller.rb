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
  		redirect_to user_path(current_user),alert:'自分のプロフィールではありません'
  	end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(@user.id),notice:"編集成功!"
  	else
  		render 'edit'
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:name,:introduction,:profile_image)
  end
end
