class CreateDailySummaries < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_summaries do |t|
      t.bigint :ranking_total_count, null: false
      t.bigint :ranking_daily_count, null: false
      t.date :date, null: false
      t.references :rubygem, null: false, foreign_key: true

      t.timestamps
    end
  end
end
