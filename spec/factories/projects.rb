FactoryBot.define do
  factory :project do
    title { "Test Project" }
    description { "A sample project description." }
    status { :pending }
  end
end
