FactoryBot.define do
  factory :rubygem do
    name { Faker::Name.unique.name }
  end
end
