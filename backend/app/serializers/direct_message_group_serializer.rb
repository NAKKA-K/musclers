class DirectMessageGroupSerializer < ActiveModel::Serializer
  include DateHelper
  has_many :direct_messages
  belongs_to :by_user, serializer: UserSerializer
  belongs_to :to_user, serializer: UserSerializer

  attributes(
    :id,
    :created_at,
    :updated_at
  )

  def created_at
    created_date(object.created_at)
  end

  def updated_at
    updated_date(object.updated_at)
  end
end


