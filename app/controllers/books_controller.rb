class BooksController < ApplicationController
  def new
  end
  
  def create
   @user = current_user
   @book = current_user.books.build(book_params)
   if @book.save
    flash[:notice] = "You have created the book successfully."
    redirect_to book_path(@book)
   else
    render :index
   end
  end


  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def edit
    book = User.find(params[:id])
    unless book.id == current_user.id
      redirect_to books_path
    end
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
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
