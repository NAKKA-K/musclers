class CreateUserTags < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tags do |t|

      #user_idという名前で外部キー制約
      t.references :user, foreign_key: {to_table: :users}

      #tag_idという名前で外部キー制約
      t.references :tag, foreign_key: {to_rrable: :tags}

      t.timestamps
    end
  end
end
