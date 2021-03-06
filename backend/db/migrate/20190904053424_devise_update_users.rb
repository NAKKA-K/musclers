# frozen_string_literal: true

class DeviseUpdateUsers < ActiveRecord::Migration[5.2]
  def up
    ## For sending mail
    add_column :users, :email, :string, null: false, default: ""

    ## Rememberable
    add_column :users, :remember_created_at, :datetime

    ## Trackable
    # t.integer  :sign_in_count, default: 0, null: false
    # t.datetime :current_sign_in_at
    # t.datetime :last_sign_in_at
    # t.inet     :current_sign_in_ip
    # t.inet     :last_sign_in_ip

    ## Confirmable
    # t.string   :confirmation_token
    # t.datetime :confirmed_at
    # t.datetime :confirmation_sent_at
    # t.string   :unconfirmed_email # Only if using reconfirmable

    ## Lockable
    # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
    # t.string   :unlock_token # Only if unlock strategy is :email or :both
    # t.datetime :locked_at

    add_index :users, :email,                unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
