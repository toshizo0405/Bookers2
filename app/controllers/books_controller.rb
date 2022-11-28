class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def new
    @book=Book.new
  end

  def index
    @user=current_user
    @books=Book.all
    @book_new=Book.new
  end

  def show
    @book= Book.find(params[:id])
    @user=@book.user
    @book_new=Book.new
  end

  def edit
    @book= Book.find(params[:id])
  end

  def update
     @book= Book.find(params[:id])
     @book.user_id = current_user.id
    if @book.update(book_params)
     redirect_to book_path(@book.id),notice: "You have updated book successfully."
    else
     render :edit
    end
  end

  def create
    @book = Book.new(book_params)
      @book.user_id = current_user.id
    if @book.save
      flash[:notice]="Welcome! You have signed up successfully."
      redirect_to book_path(@book), notice: "You have created book successfully"
    else
      @user = current_user
      @books = Book.all
      @book_new=@book
      render 'index'
    end

  end

    def destroy
    @book =Book.find(params[:id])
    @book.destroy
    redirect_to books_path
    end




  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

  def correct_user
      @book = Book.find(params[:id])
      @user = @book.user
      redirect_to(books_path) unless @user == current_user
  end


end
