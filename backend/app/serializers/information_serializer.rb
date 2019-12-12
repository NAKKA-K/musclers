class InformationSerializer < ActiveModel::Serializer
  attributes :id, :genre, :by_name, :link, :thumbnail

  def genre
    object.genre_i18n
  end

end