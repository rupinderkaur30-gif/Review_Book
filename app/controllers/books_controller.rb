class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]
    def index
        @books = Book.all
        if params[:search]
         @books = @books.search_by_title(params[:search]) 
        end
       
    end

    def new
        @book = Book.new
    end

    def create
       book = Book.create(book_params)
       redirect_to book
    end
    def show
        @review = Review.new
        @book = Book.find(params[:id])
    end

    def edit
        
    end

    def update
       @book.update(book_params)
       redirect_to(book_params)
    end


    def destroy
    
      @book.destroy
      redirect_to books_path
    end

    private 

    def set_book
        @book = Book.find(params[:id])

    end

    def book_params
        params.require(:book).permit(:title,  :genre, :author, :years_published)
    end
end
