class AddThumbnailColumnToInformation < ActiveRecord::Migration[5.2]
  def change
    add_column :information, :thumbnail, :string
  end
end
