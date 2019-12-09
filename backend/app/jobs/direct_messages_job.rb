class DirectMessagesJob < ApplicationJob
  def perform(message)
    ActionCable.server.broadcast("dm_#{message.direct_message_group_id}",message.body)
  end
end
