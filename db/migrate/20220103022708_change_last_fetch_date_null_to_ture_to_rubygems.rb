class ChangeLastFetchDateNullToTureToRubygems < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        change_column :rubygems, :last_fetch_date, :date, null: true
      end

      dir.down do
        change_column :rubygems, :last_fetch_date, :date, null: false
      end
    end
  end
end
