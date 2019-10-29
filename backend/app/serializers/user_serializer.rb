class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
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
    if object.thumbnail.attached?
      url_for(object.thumbnail)
    else
      "http://localhost:8080/images/noimage.png"
    end
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
