FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    published { false }
    user

    trait :published do
      published { true }
    end
  end
end
