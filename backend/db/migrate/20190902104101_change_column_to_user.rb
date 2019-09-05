class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :gender, :integer, null: false, default: 0
    change_column :users, :figure, :integer, null: false, default: 0
  end

  def down
    change_column :users, :gender, :integer, null: true
    change_column :users, :figure, :integer, null: true
  end
end
