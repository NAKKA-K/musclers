module Api
  class DirectMessageGroupsController < ApplicationController
    include DateHelper

    def index
      data = make_dm_list_data
      success_res(200, message: '取得しました', data: data) and return
    end

    private

    def make_dm_list_data
      data = []
      current_user = User.find(@current_user.id)

      current_user_dm_list = []
      current_user_dm_list += current_user.by_users
      current_user_dm_list += current_user.to_users

      unless current_user_dm_list.present?
        data
      end

      users_data_hash = make_user_data_of_dm_list_hash(current_user_dm_list)
      latest_messages_hash = make_latest_messages_hash(current_user_dm_list)

      current_user_dm_list.each do |item|
        latest_message = latest_messages_hash.include?(item.id) ? latest_messages_hash[item.id] : nil

        data << {
          "id": item.id,
          "by_user": UserSerializer.new(users_data_hash[item.by_user_id]).as_json,
          "to_user": UserSerializer.new(users_data_hash[item.to_user_id]).as_json,
          "created_at": created_date(item.created_at),
          "updated_at": updated_date(item.updated_at),
          "latest_message": LatestMessageSerializer.new(latest_message).as_json
        }
      end

      data
    end

    def make_user_data_of_dm_list_hash(dm_list)
      user_id_list = []
      dm_list.each do |item|
        unless user_id_list.include?(item.by_user_id)
          user_id_list << item.by_user_id
        end

        unless user_id_list.include?(item.to_user_id)
          user_id_list << item.to_user_id
        end
      end

      users_data = User.where(id: user_id_list).with_attached_thumbnail 
      hash = users_data.map { |user| [user.id, user] }.to_h

      hash
    end

    def make_latest_messages_hash(dm_list)
      direct_message_group_id_list = []

      dm_list.each do |item|
        unless direct_message_group_id_list.include?(item.id)
          direct_message_group_id_list << item.id
        end
      end

      direct_messages = DirectMessage.fetch_direct_message_data(direct_message_group_id_list)
      hash = direct_messages.map { |message| [message.direct_message_group_id, message] }.to_h

      hash
    end

  end
end
  