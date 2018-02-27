class BooksController < ApplicationController
  skip_before_action :authenticate_user!, :only => :index

  def index
    # debugger
    if params[:search].present?
      @books = Book.where("auther LIKE ?", "%#{params[:search]}%")
    else
  	 @books = Book.all
    end
    respond_to do |format| 
      format.html 
      format.js 
    end
  end

  def new
  	@books = Book.new
  end

  def create
    @books = Book.new(books_params)
    if @books.save
    	redirect_to books_path
    else
    	redirect_to new_book_path 
    end 
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
	  @book = Book.find(params[:id])
	 
	  if @book.update(books_params)
	    redirect_to books_path
	  else
	    render 'edit'
	  end
	end

	def destroy
    @book = Book.find(params[:id])
    @book.destroy
 
    redirect_to books_path
  end 
  
  private
  
  def books_params
  	params.require(:book).permit(:title, :auther, :name, :attachment)
  
  end
end
