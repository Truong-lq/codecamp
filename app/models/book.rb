class Book < ApplicationRecord
  class << self
    def search_by_title_content(query)
      self.where "title LIKE ? OR content LIKE ?", "%#{query}%", "%#{query}%"
    end
  end
end
