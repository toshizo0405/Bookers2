class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @books=@user.books
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
  end

  def index
    @books=Book.all
    @user=current_user
    @users=User.all
  end

 private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
