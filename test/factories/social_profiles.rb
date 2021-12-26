FactoryBot.define do
  factory :social_profile do
    transient do
      google { Faker::Omniauth.unique.google }
    end

    user { nil }
    provider { google[:provider] }
    uid { google[:uid] }
    email { google[:info][:email] }

    trait :with_user do
      user { build :user }
    end
  end
end
