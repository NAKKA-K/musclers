class ChangeUsersNameNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :nickname, false
  end
end
