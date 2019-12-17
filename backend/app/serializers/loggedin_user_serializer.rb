class LoggedinUserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  include ThumbnailHelper
  attributes(
    :id,
    :access_token,
    :nickname,
    :email,
    :thumbnail,
    :description,
    :age,
    :gender,
    :height,
    :weight,
    :figure,
    :muscle_mass,
    :body_fat_percentage,
    :seriousness,
    :provider,
    :created_at,
    :updated_at
  )

  def gender
    object.gender_i18n
  end

  def figure
    object.figure_i18n
  end

  def seriousness
    object.seriousness_i18n
  end

  def thumbnail
    make_thumbnail_url(object.thumbnail)
  end
end
