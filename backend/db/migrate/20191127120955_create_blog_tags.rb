class CreateBlogTags < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_tags do |t|
      #blog_idという名前で外部キー制約
      t.references :blog, foreign_key: {to_table: :blogs}

      #tag_idという名前で外部キー制約
      t.references :tag, foreign_key: {to_rrable: :tags}
      t.timestamps
    end
  end
end
