class RemoveThumbnailFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :thumbnail, :string
  end
end
