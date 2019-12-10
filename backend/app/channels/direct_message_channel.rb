class DirectMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "dm_#{params[:room]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def direct_message(data)
    DirectMessage.create!(body: data['message'],send_user_id: current_user.id,direct_message_group_id: data['dmId'])
  end
end
