require_relative '../app/models/author'
require_relative '../app/models/book'
require 'faker'

# Create authors
20.times do
  Author.create(name: Faker::Name.name, email: Faker::Internet.email)
end

# Create books
10.times do
  Book.create(title: Faker::Book.title, author: Author.all.sample)
end
