class ChangeBlogsColumnNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column :blogs, :title, :string, null: false, default: ""
    change_column :blogs, :body, :text, null: false, default: ""
  end
end
