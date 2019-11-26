module Api
  class DirectMessageGroupsController < ApplicationController
    include DateHelper
    def index
      user = User.find(current_user.id)
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

      current_user_dm_list.each do |item|
        latest_message = DirectMessage.where(direct_message_group_id:item.id).order(created_at: "DESC").first

        by_user = User.find(item.by_user_id)
        to_user = User.find(item.to_user_id)

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

  end
end
  