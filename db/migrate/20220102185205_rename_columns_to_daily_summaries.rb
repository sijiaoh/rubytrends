class RenameColumnsToDailySummaries < ActiveRecord::Migration[7.0]
  def change
    change_table :daily_summaries, bulk: true do |t|
      t.rename :ranking_daily_count, :daily_downloads
      t.rename :ranking_total_count, :total_downloads
    end
  end
end
