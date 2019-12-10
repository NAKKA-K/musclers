class ChangeIsPendingDefaultToFriends < ActiveRecord::Migration[5.2]
  def change
    change_column_default :friends, :is_pending, from: false, to: true
  end
end
