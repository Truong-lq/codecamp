require 'faker'

100.times do |i|
  title = Faker::Book.title
  content = Faker::Lorem.paragraph sentence_count: 15

  Book.create! title: title, content: content
end
