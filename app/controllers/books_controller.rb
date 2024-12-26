class BooksController < ApplicationController
  def search
    books = Book.search_by_title_content(params[:query]).limit 12
    render partial: "book_list", locals: { books: books }
  end
end
