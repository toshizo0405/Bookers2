class BooksController < ApplicationController
  def new
    @book=Book.new
  end

  def index
    @user=current_user
    @books=Book.all
  end

  def show
    
  end

  def edit
  end
  
  def create
    @book = Book.new(book_params)
      @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully"
    else
      @user = current_user
      @books = Book.all
      render 'index'
    end
  end




  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end


end
