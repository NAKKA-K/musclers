class DirectMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "dm"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def direct_message(data)
    ActionCable.server.broadcast("dm",data['message'])
  end
end
