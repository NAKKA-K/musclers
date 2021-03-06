class GroupSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  include DateHelper
  include ThumbnailHelper

  attributes(
    :id,
    :name,
    :description,
    :is_public,
    :tags,
    :thumbnail,
    :created_at,
    :updated_at,
    :joined
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

