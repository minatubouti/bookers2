class BooksController < ApplicationController
  def new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end
  

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private
  def book_params
   params.require(:book).permit(:title, :body, :image)
  end
end
