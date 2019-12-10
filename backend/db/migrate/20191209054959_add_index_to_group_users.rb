class AddIndexToGroupUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :group_users, [:group_id, :user_id], unique: true
  end
end
