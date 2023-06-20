class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(@book.)
  end
  

  def index
  end

  def show
  end
  
  def update
  end
  
  def destroy
  end
end
