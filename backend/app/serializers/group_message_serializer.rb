class GroupMessageSerializer < ActiveModel::Serializer
  include DateHelper
  attributes :id, :body,:send_user, :created_at, :updated_at
  
  def send_user
    UserSerializer.new(object.user)
  end

  def created_at
    created_date(object.created_at)
  end

  def updated_at
    updated_date(object.updated_at)
  end
end