class DirectMessage < ApplicationRecord
  belongs_to  :direct_message_group
  belongs_to :send_user, class_name: "User", foreign_key: "send_user_id"
end
