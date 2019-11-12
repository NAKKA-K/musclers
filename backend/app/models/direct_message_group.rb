class DirectMessageGroup < ApplicationRecord
  belongs_to :by_user, class_name: "User", foreign_key: "by_user_id"
  belongs_to :to_user, class_name: "User", foreign_key: "to_user_id"
  has_many  :direct_messages, :dependent => :destroy
end
