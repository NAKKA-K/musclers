class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  include ThumbnailHelper
  attributes(
    :id,
    :nickname,
    :thumbnail,
    :description,
    :age,
    :gender,
    :height,
    :weight,
    :figure,
    :muscle_mass,
    :body_fat_percentage,
    :created_at,
    :updated_at,
    :seriousness
  )

  def thumbnail
    make_thumbnail_url(object.thumbnail)
  end

  def gender
    object.gender_i18n
  end

  def figure
    object.figure_i18n
  end

  def seriousness
    object.seriousness_i18n
  end
end
