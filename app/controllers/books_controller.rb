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

  def post_review
    book = Book.find_by id: params[:book_id]
    review = book.reviews.build review_params
    
    if review.save
      html = render partial: "review_list", locals: { reviews: book.reviews }
      ActionCable.server.broadcast("post_review_channel", html)
    else
      render json: { msg: "Content cannot be blank" }
    end
  end

  private

  def review_params
    params.require(:review).permit :content
  end
end
