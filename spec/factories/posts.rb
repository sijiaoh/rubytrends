# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string(255)      not null
#  content    :text(65535)      not null
#  published  :boolean          default(FALSE), not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  hashid     :string(255)
#
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
