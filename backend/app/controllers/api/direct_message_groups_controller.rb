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

      users_data_hash = fetch_user_data_of_dm_list_hash(current_user_dm_list,current_user.id)
      current_user_dm_list.each do |item|
        latest_message = DirectMessage.where(direct_message_group_id:item.id).order(created_at: "DESC").first

        by_user = users_data_hash[item.by_user_id]
        to_user = users_data_hash[item.to_user_id]

        data << {
          "id": item.id,
          "by_user": UserSerializer.new(by_user).as_json,
          "to_user": UserSerializer.new(to_user).as_json,
          "created_at": created_date(item.created_at),
          "updated_at": updated_date(item.updated_at),
          "latest_message": LatestMessageSerializer.new(latest_message).as_json
        }
      end

      data
    end

    def fetch_user_data_of_dm_list_hash(dm_list,current_user_id)
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

  end
end
  