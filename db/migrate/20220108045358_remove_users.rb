class RemoveUsers < ActiveRecord::Migration[7.0]
  def up
    drop_table :social_profiles
    drop_table :users
  end
end
