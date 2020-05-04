class BooksController < ApplicationController
  def top
  end

  def index
  	@user = User.find(current_user.id)
  	@book_new = Book.new
  	@books = Book.all
  end

  def create
  	@user = User.find(current_user.id)
  	@books =  Book.all
  	@book_new = Book.new(book_params)
  	@book_new.user_id = current_user.id
  	if @book_new.save
  		flash[:notice]="投稿成功！"
  		redirect_to book_path(@book_new.id)
  	else
  		render 'index'
  	end
  end

  def show

  	@book = Book.find(params[:id])
  	@user = User.find(@book.user_id)
  	@book_new = Book.new
  end

  def edit
  	@book = Book.find(params[:id])
  	if current_user.id != @book.user_id
  		redirect_to user_path(current_user)
  	end
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  		flash[:notice]= "編集成功！"
  		redirect_to book_path(@book.id)
  	else
  		render 'books#edit'
  	end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
