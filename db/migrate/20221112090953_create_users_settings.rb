class CreateUsersSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :users_settings do |t|
      t.references :user, null: false, foreign_key: true, index: { unique: true }
      t.integer :editor_type, null: false

      t.timestamps
    end
  end
end
