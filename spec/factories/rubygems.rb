# == Schema Information
#
# Table name: rubygems
#
#  id              :bigint           not null, primary key
#  name            :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  last_fetch_date :date
#
FactoryBot.define do
  factory :rubygem do
    name { Faker::Internet.unique.username.tr ".", "_" }
  end
end
