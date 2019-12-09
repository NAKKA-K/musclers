class DirectMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "dm_#{params[:room]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def direct_message(data)
    begin
      DirectMessage.create!(body: data['message'],send_user_id: current_user.id,direct_message_group_id: data['dmId'])
    rescue ActiveRecord::RecordInvalid
      ActionCable.server.broadcast("dm_#{params[:room]}",'メッセージの送信に失敗しました')
    rescue => e
      #送信したユーザのみに返したい
      ActionCable.server.broadcast("dm_#{params[:room]}",'メッセージの送信に失敗しました')
    end
  end
end
