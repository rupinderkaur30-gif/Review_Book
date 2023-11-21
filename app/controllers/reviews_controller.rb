class ReviewsController < ApplicationController
before_action :set_review, only: [:show, :update, :destroy]
before_action :set_books, only: [:create]
    def create 
        @review = @book.reviews.build(review_params)
        @review.user = current_user
        if @review.save
            redirect_to @book
        else
           render :"books/show"
        end
    end
    def show
    end
    def edit
    end

    def update
        if @review.update(review_params)
            redirect_to @review.book
        else
            render :edit
        end
    end

    def destroy
        @review.destroy
        redirect_to books_path
    end

    private
    def set_review
        @review = Review.find(params[:id])
    end
   
    def set_books
     @book = Book.find(params[:book_id]) if params[:book_id]
    end

    def review_params
        params.require(:review).permit(:content)
    end
end
