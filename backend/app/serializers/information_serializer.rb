class InformationSerializer < ActiveModel::Serializer
  attributes :id, :type, :by_name, :link

  def type
    object.type_i18n
  end
end
