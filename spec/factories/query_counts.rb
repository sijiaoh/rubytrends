FactoryBot.define do
  factory :query_count do
    query { "MyString" }
    count { 1 }
  end
end
