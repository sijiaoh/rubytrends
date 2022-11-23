class AddEditorTypeToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :editor_type, :integer, null: false, default: 0
  end
end
