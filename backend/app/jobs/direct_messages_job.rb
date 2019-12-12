class DirectMessagesJob < ApplicationJob
  def perform(message)
    data = SendMessageSerializer.new(message).as_json
    ActionCable.server.broadcast("dm_#{message.direct_message_group_id}",data)
  end
end
