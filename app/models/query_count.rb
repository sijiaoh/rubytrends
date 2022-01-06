class QueryCount < ApplicationRecord
  def self.count_query!(query)
    query = query.split("~").sort.join("~")

    query_count = find_by query: query
    if query_count.present?
      query_count.increment! :count # rubocop:disable Rails/SkipsModelValidations
    else
      create! query: query
    end
  end
end
