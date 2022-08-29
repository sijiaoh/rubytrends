# == Schema Information
#
# Table name: daily_summaries
#
#  id              :bigint           not null, primary key
#  total_downloads :bigint           not null
#  daily_downloads :bigint           not null
#  date            :date             not null
#  rubygem_id      :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :daily_summary do
    ranking_total_count { "" }
    ranking_daily_count { "" }
    date { "2022-01-03" }
    rubygem { nil }
  end
end
