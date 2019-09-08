class ChangeOmniAuthInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tokens, :json

    change_column :users, :uid, :string, null: false
    change_column :users, :provider, :string, null: false

    add_index :users, [:uid, :provider], unique: true
  end
end
