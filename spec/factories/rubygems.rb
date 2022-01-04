FactoryBot.define do
  factory :rubygem do
    name { Faker::Internet.unique.username.tr ".", "_" }
  end
end
