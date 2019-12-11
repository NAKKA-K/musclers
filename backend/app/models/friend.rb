class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :target ,class_name: "User", foreign_key: "target_id"

  attr_accessor :from_user
  after_create_commit :notice_friend_request
end
