class DirectMessageGroup < ApplicationRecord
  belongs_to :user
  has_many  :direct_messages, :dependent => :destroy
end
