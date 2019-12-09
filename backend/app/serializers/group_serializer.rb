class GroupSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  include DateHelper

  attributes(
    :id,
    :name,
    :description,
    :is_public,
    :tags,
    :thumbnail,
    :created_at,
    :updated_at
  )

  def thumbnail
    if object.thumbnail.attached?
      url_for(object.thumbnail)
    else
      root_url + "images/noimage.png"
    end
  end

  def created_at
    created_date(object.created_at)
  end

  def updated_at
    updated_date(object.updated_at)
  end
end
