class LoggedinUserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
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

  def thumbnail
    if object.thumbnail.attached?
      url_for(object.thumbnail)
    else
      root_url + "images/noimage.png"
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
