class BooksController < ApplicationController
  def search
    books = Book.search_by_title_content(params[:query]).limit 12
    render partial: "book_list", locals: { books: books }
  end

  def index
    @books = Book.limit 12
  end

  def show
    @book = Book.find_by id: params[:id]
    @review = @book.reviews.build
  end

  def create_review
    @book = Book.find_by id: params[:book_id]
    @review = @book.reviews.build review_params

    if @review.save
      redirect_to book_path(@book)
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit :content
  end
end
