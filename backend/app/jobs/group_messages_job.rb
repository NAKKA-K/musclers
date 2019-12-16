class GroupMessagesJob < ApplicationJob
  def perform(message)
    data = SendGroupMessageSerializer.new(message).as_json
    ActionCable.server.broadcast("group_#{message.group_id}",data)
  end
end
