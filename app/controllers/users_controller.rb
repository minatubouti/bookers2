class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
     user = User.find(params[:id])
     unless user.id == current_user.id
       redirect_to books_path
     end
     @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end
  
  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to user_path(@user.id)
   else
    render :edit
   end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
