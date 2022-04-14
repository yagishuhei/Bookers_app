class BooksController < ApplicationController
  def new
     @book= Book.new
  end

  def create
    @book= Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id), success: 'New post successfully'
    else
      flash.now[:danger] = "new post error"
      @books=Book.all
      render :index
    end
  end

  def index
     @books=Book.all
      @book= Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
      @book= Book.find(params[:id])
   if  @book.update(book_params)
    redirect_to book_path(@book.id), success: 'update successfully'
   else
     flash.now[:danger] = "new post error"
      render :edit
   end
  end

   def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
   end

   def edit
    @book= Book.find(params[:id])
   end

private

  def book_params
    params.require(:book).permit(:title,:body)
  end
end