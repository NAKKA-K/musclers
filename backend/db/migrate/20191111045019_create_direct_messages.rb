class CreateDirectMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :direct_messages do |t|
      t.text :body
      t.references :direct_message_group, foreign_key: { to_table: :direct_message_groups }

      t.timestamps
    end
  end
end
