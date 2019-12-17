class GroupMessage < ApplicationRecord
  belongs_to :user
  belongs_to :group

  after_create_commit { GroupMessagesJob.perform_later self }
end
