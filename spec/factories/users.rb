FactoryBot.define do
  factory :user do
    first_name { "Test" }
    last_name { "User" }
    email { Faker::Internet.email }
    password { "password123" }
  end
end
