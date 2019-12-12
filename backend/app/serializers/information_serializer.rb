class InformationSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :genre, :by_name, :link, :thumbnail

  def genre
    object.genre_i18n
  end

  def thumbnail
    user = User.find_by_nickname(object.by_name)
    if user.thumbnail.attached?
      url_for(user.thumbnail)
    else
      root_url + "images/noimage.png"
    end
  end
end