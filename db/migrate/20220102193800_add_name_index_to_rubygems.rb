class AddNameIndexToRubygems < ActiveRecord::Migration[7.0]
  def change
    add_index :rubygems, :name, unique: true
  end
end
