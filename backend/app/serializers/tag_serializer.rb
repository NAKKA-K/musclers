class TagSerializer < ActiveModel::Serializer
  attributes :id, :name

  def name
    object.name_i18n
  end
end
