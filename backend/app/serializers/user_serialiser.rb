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
  end

  def figure
  end

  def seriousness
  end
end