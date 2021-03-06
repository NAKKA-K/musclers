class BlogSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  include DateHelper
  include ThumbnailHelper

  has_many :tags

  attributes(
    :id,
    :title,
    :body,
    :thumbnail,
    :created_at,
    :updated_at
  )

  def thumbnail
    make_thumbnail_url(object.thumbnail)
  end

  def created_at
    created_date(object.created_at)
  end

  def updated_at
    updated_date(object.updated_at)
  end
end


