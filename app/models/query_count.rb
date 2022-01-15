class QueryCount < ApplicationRecord
  def self.count_query!(query)
    query = query.split("~").uniq.sort.join("~")

    query_count = find_by query: # rubocop:disable Lint/UselessAssignment
    if query_count.present?
      query_count.increment! :count # rubocop:disable Rails/SkipsModelValidations
    else
      create! query:
    end
  end
end
