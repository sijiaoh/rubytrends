class AddRubygemIdDateIndexToDailySummaries < ActiveRecord::Migration[7.0]
  def change
    add_index :daily_summaries, [:rubygem_id, :date], unique: true
  end
end
