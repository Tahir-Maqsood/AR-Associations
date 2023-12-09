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

# Helper method to generate random names
def generate_random_name
  Faker::Name.unique.name
end

# Create 10 physicians
10.times do
  Physician.create(name: generate_random_name)
end

# Create 10 patients
10.times do
  Patient.create(name: generate_random_name)
end

# Create 10 appointments associating physicians and patients
10.times do
  Appointment.create(
    physician: Physician.all.sample,
    patient: Patient.all.sample,
    appointment_date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30, format: :default)
  )
end

# Create 10 assemblies
10.times do
  Assembly.create(name: generate_random_name)
end

# Create 10 parts
10.times do
  Part.create(name: generate_random_name)
end

# Associate random parts with random assemblies
Assembly.all.each do |assembly|
  assembly.parts << Part.all.sample(rand(1..5))  # You can adjust the range as needed
end

# Helper method to generate random titles and content (polymorphic association)
def generate_random_text
  Faker::Lorem.sentence
end

# Create 5 posts
5.times do
  post = Post.create(
    title: generate_random_text,
    content: generate_random_text
  )

  # Create 2 comments for each post
  2.times do
    post.comments.create(body: generate_random_text)
  end
end

# Create 5 blogs
5.times do
  blog = Blog.create(
    title: generate_random_text,
    content: generate_random_text
  )

  # Create 2 comments for each article
  2.times do
    blog.comments.create(body: generate_random_text)
  end
end
