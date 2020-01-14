class Friend < ApplicationRecord
  include Rails.application.routes.url_helpers
  include ThumbnailHelper

  belongs_to :user
  belongs_to :target ,class_name: "User", foreign_key: "target_id"

  attr_accessor :from_user
  after_create_commit :notice_friend_request

  private

  def notice_friend_request
    Information.create(
      genre: Information.genres[:friend_request],
      by_name: from_user.nickname,
      link: "/users/#{from_user.id}",
      is_read: false,
      user_id: self.target_id,
      thumbnail: make_thumbnail_url(from_user.thumbnail)
    )
  end
end
