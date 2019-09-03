class ChangeColumnToUser2 < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :seriousness, :integer, null: false, default: 0
  end

  def down
    change_column :users, :seriousness, :integer, null: true
  end
end
