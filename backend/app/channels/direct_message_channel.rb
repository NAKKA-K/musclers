class DirectMessageChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from "dm_#{params[:room]}"
  end

  def unsubscribed
    stop_all_streams
  end

  def direct_message(data)
    DirectMessage.create!(body: data['message'],send_user_id: current_user.id,direct_message_group_id: data['dmId'])
  end
end
