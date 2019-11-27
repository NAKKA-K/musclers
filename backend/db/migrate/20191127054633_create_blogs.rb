class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      #user_idという名前で外部キー制約
      t.references :user, foreign_key: {to_table: :users}
      t.string :titile
      t.text :body
      #　ブログサムネのカラム、取り敢えず保留
      #　t.string :thumbnail

      t.timestamps
    end
  end
end
