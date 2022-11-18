class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @books=@user.books
  end

  def edit
  end

  def update
  end

  def index
    @books=Book.all
    @user=current_user
  end

end
