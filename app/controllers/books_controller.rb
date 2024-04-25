class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    @user = @book.user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end

  def new
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else 
      @books = Book.all
      @user = User.find(current_user.id)
      puts @book.errors.full_messages
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    unless @user.id == current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
    puts @book.errors.full_messages
    render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user

  end
end