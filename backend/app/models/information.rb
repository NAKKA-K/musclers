class Information < ApplicationRecord
  belongs_to :user

  enum genre:  { group_invitation: 0, friend_request: 1, direct_message: 2, group_message: 3}, _prefix: true
end
