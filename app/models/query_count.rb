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
class QueryCount < ApplicationRecord
  def self.count_query!(query)
    query = query.split("~").uniq.sort.join("~")

    query_count = find_by(query:)
    if query_count.present?
      query_count.increment! :count # rubocop:disable Rails/SkipsModelValidations
    else
      create! query:
    end
  end
end
