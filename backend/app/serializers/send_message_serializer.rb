class SendMessageSerializer < ActiveModel::Serializer
  include DateHelper
  attributes :id, :body, :send_user_id, :created_at, :updated_at

  def created_at
    created_date(object.created_at)
  end

  def updated_at
    updated_date(object.updated_at)
  end

end
