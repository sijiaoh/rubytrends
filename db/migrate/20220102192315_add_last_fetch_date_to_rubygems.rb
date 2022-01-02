class AddLastFetchDateToRubygems < ActiveRecord::Migration[7.0]
  def change
    add_column :rubygems, :last_fetch_date, :date, null: false # rubocop:disable Rails/NotNullColumn
  end
end
