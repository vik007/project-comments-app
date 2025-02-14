require 'faker'

# Clear existing data
Comment.destroy_all
Project.destroy_all
User.destroy_all

# Create Users
users = []
10.times do
  users << User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    password: "password123"  # Default password for all users
  )
end

# Create Projects
projects = []
20.times do
  projects << Project.create!(
    title: Faker::App.name,
    status: rand(0..2),  # Assuming 0 = pending, 1 = in-progress, 2 = completed
    description: Faker::Lorem.paragraph(sentence_count: 3),
    slug: Faker::Internet.unique.slug
  )
end

# Create Comments
50.times do
  Comment.create!(
    content: Faker::Lorem.sentence(word_count: 10),
    user: users.sample,   # Random user
    project: projects.sample # Random project
  )
end
