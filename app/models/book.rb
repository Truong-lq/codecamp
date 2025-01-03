class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  class << self
    def search_by_title_content(query)
      self.where "title LIKE ? OR content LIKE ?", "%#{query}%", "%#{query}%"
    end
  end
end
