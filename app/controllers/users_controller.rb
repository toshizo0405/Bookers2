class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def show
    @user=User.find(params[:id])
    @books=@user.books
    @book_new=Book.new
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user= User.find(params[:id])
   if @user.update(user_params)
    flash[:notice]="You have updated user successfully."
    redirect_to user_path(current_user)
   else
    render :edit
   end
  end


  def index
    @book_new=Book.new
    @books=Book.all
    @user=current_user
    @users=User.all
  end

 private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
     @user = User.find(params[:id])
    redirect_to(books_path) unless @user == current_user
  end



end
