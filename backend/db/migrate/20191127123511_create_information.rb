class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.integer :type
      t.string :by_name
      t.string :link
      t.boolean :is_read, default: false, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
