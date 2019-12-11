module Api
  class DirectMessageGroupsController < ApplicationController
    include DateHelper

    def index
      data = make_dm_list_data
      success_res(200, message: '取得しました', data: data) and return
    end

    def show
      data = DirectMessageGroup.preload(:direct_messages, :by_user, :to_user).find(params[:id])
      success_res(
        200,
        message: '取得しました',
        data: DirectMessageGroupSerializer.new(data).as_json
      ) and return
    end

    private

    def make_dm_list_data
      current_user_dm_list = [] + current_user.by_users + current_user.to_users

      unless current_user_dm_list.present?
        return nil
      end

      users_data = make_user_data_of_dm_list_hash(current_user_dm_list)
      latest_messages = make_latest_messages_hash(current_user_dm_list)

      current_user_dm_list.map do |item|
        latest_message = latest_messages.find { |message| message.direct_message_group_id == item.id }
        {
          "id": item.id,
          "by_user": UserSerializer.new(users_data.find {|user| user.id == item.by_user_id }).as_json,
          "to_user": UserSerializer.new(users_data.find {|user| user.id == item.to_user_id }).as_json,
          "created_at": created_date(item.created_at),
          "updated_at": updated_date(item.updated_at),
          "latest_message": latest_message.present? ? LatestMessageSerializer.new(latest_message) : nil
        }
      end
    end

    def make_user_data_of_dm_list_hash(dm_list)
      user_ids = []
      dm_list.each do |item|
        unless user_ids.include?(item.by_user_id)
          user_ids << item.by_user_id
        end

        unless user_ids.include?(item.to_user_id)
          user_ids << item.to_user_id
        end
      end

      User.fetch_users(user_ids)
    end

    def make_latest_messages_hash(dm_list)
      direct_message_group_ids = dm_list.map {|item| item.id }.uniq
      DirectMessage.fetch_direct_message_data(direct_message_group_ids)
    end

  end
end

