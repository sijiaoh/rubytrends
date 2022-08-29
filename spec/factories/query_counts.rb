# == Schema Information
#
# Table name: query_counts
#
#  id         :bigint           not null, primary key
#  query      :string(255)      not null
#  count      :integer          default(1), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :query_count do
    query { "MyString" }
    count { 1 }
  end
end
