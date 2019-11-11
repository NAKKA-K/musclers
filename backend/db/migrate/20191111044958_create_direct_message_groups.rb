class CreateDirectMessageGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :direct_message_groups do |t|
      t.references :by_user, foreign_key: { to_table: :users }
      t.references :to_user, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
