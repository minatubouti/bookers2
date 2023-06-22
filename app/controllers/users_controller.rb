class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
  end

  def edit
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
