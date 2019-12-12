class InformationSerializer < ActiveModel::Serializer
  attributes :id, :genre, :by_name, :link

  def genre
    object.genre_i18n
  end
end
