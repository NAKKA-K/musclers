class GroupMessageChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from "group_#{params[:room]}"
  end

  def unsubscribed
    stop_all_streams
  end

  def group_message(data)
    GroupMessage.create!(body: data['message'],user_id: current_user.id,group_id: data['groupId'])
    #ActionCable.server.broadcast("group_#{params[:room]}",'yaaaaaaaa')
  end
end
