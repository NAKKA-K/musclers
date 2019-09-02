class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :thumbnail
      t.text :description
      t.integer :age
      t.integer :gender
      t.integer :height
      t.integer :weight
      t.integer :figure
      t.integer :muscle_mass
      t.integer :body_fat_percentage
      t.integer :seriousness

      t.timestamps
    end
  end
end
