class RenameTypeColumnToInformation < ActiveRecord::Migration[5.2]
  def change
    rename_column :information, :type, :genre
  end
end
