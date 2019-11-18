class AddColumnToDirectMessage < ActiveRecord::Migration[5.2]
  def change
    add_reference :direct_messages, :send_user, foreign_key: { to_table: :users }
  end
end
