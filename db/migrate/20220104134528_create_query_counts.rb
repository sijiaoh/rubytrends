class CreateQueryCounts < ActiveRecord::Migration[7.0]
  def change
    create_table :query_counts do |t|
      t.string :query, null: false
      t.integer :count, default: 1, null: false

      t.timestamps

      t.index :query, unique: true
    end
  end
end
