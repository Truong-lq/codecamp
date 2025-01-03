require "faker"

100.times do |i|
  p "Seeding..."
  title = Faker::Book.title
  content = Faker::Lorem.paragraph sentence_count: 15

  book = Book.create! title: title, content: content
  book.reviews.create! content: Faker::Lorem.paragraph
end
