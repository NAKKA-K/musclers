class SendGroupMessageSerializer < ActiveModel::Serializer
  include DateHelper
  attributes :id, :body, :user,:group_id, :created_at, :updated_at
  belongs_to :user,key: :send_user, serializer: UserSerializer

  def created_at
    created_date(object.created_at)
  end

  def updated_at
    updated_date(object.updated_at)
  end

end
