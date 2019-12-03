class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.references :user, foreign_key: true
      t.references :target, foreign_key: { to_table: :users }
      t.boolean :is_pending, default: false, null: false

      t.timestamps

      t.index [:user_id, :target_id], unique: true
    end
  end
end
