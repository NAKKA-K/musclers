class Group < ApplicationRecord
  has_many :group_users
  has_many :users,through: :group_users, :dependent => :destroy
  has_many :group_messages, :dependent => :destroy
  has_one_attached :thumbnail

  validates :name, presence: true, length: { maximum: 128 }
  validates :description, presence: true, length: { maximum: 4096 }
  validates :is_public, presence: true
end
