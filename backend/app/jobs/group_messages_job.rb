class GroupMessagesJob < ApplicationJob
  include Rails.application.routes.url_helpers
  include ThumbnailHelper

  def perform(message)
    begin
      group = message.group
      group_thumbnail = make_thumbnail_url(group.thumbnail)
      user_ids = group.users.pluck(:id).map {|item| item if item != message['user_id']}.compact
      ActiveRecord::Base.transaction do
        user_ids.each do |user_id|
          Information.create!(
            genre: Information.genres[:group_message],
            by_name: group.name,
            link: "/groups/#{message.group_id}",
            is_read: false,
            user_id: user_id,
            thumbnail: group_thumbnail
          )
        end
      end

      data = SendGroupMessageSerializer.new(message).as_json
      ActionCable.server.broadcast("group_#{message.group_id}",data)
    rescue ActiveRecord::RecordNotFound
      ActionCable.server.broadcast("group_#{message.group_id}",'メッセージの送信に失敗しました')
    rescue ActiveRecord::RecordInvalid
      ActionCable.server.broadcast("group_#{message.group_id}",'メッセージの送信に失敗しました')
    rescue => e
      logger.error(e)
      ActionCable.server.broadcast("group_#{message.group_id}",'メッセージの送信に失敗しました')
    end
  end

  protected

  def default_url_options
    Rails.application.config.active_job.default_url_options
  end
end
