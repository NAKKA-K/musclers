class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.boolean :is_public, default: false, null: false
      t.string :tags

      t.timestamps
    end
  end
end
