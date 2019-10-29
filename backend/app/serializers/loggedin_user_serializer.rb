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
    :created_at,
    :updated_at
  )

  def thumbnail
    if object.thumbnail.attached?
      url_for(object.thumbnail)
    else
      "http://localhost:8080/images/noimage.png"
    end
  end

end
