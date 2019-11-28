class ChangeUsersNicknameNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :nickname, false
    change_column :users, :nickname, :string, default: ""
  end
end
