class LatestMessageSerializer < ActiveModel::Serializer
  include DateHelper
  attributes(
    :id,
    :body,
    :created_at,
    :updated_at
  )

  def id
    object.nil? ? "" : object.id
  end

  def body
    object.nil? ? "" : object.body
  end

  def created_at
    object.nil? ? "" : created_date(object.created_at)
  end

  def updated_at
    object.nil? ? "" : updated_date(object.updated_at)
  end
end
