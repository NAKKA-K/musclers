class DirectMessage < ApplicationRecord
  belongs_to  :direct_message_group
  belongs_to  :send_user, class_name: "User", foreign_key: "send_user_id"

  after_create_commit { DirectMessagesJob.perform_later self }

  scope :search_direct_message, ->(dm_group_id_list) {
    where(direct_message_group_id: dm_group_id_list).order(direct_message_group_id: :DESC)
  }

  def self.fetch_direct_message_data(direct_message_group_id_list)
    search_direct_message(direct_message_group_id_list)
  end
end
