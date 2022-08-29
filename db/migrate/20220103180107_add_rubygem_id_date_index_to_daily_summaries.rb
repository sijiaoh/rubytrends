class AddRubygemIdDateIndexToDailySummaries < ActiveRecord::Migration[7.0]
  def change
    add_index :daily_summaries, %i[rubygem_id date], unique: true
  end
end
