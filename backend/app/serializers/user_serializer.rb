class UserSerializer < ActiveModel::Serializer
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
