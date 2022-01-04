class QueryCount < ApplicationRecord
  def self.count_query(query)
    query_count = find_by query: query
    if query_count.present?
      query_count.increment! :count # rubocop:disable Rails/SkipsModelValidations
    else
      query_count = create! query: query
    end
    query_count
  end
end
