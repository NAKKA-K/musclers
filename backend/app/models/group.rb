class Group < ApplicationRecord
  attr_accessor :joined

  has_many :group_users
  has_many :users,through: :group_users, :dependent => :destroy
  has_many :group_messages, :dependent => :destroy
  has_one_attached :thumbnail

  validates :name, presence: true, length: { maximum: 128 }
  validates :description, presence: true, length: { maximum: 4096 }
  validates :is_public, presence: true

  def self.set_group_joined_to(groups, auth_id)
    # HACK: eagerloadでやる方法がついぞ分からなかったため自分で実装
    # ログイン中のユーザーがグループに参加しているか判定するflagを追加
    group_ids = groups.map(&:id)
    joined_ids = GroupUser.where(user_id: auth_id, group_id: group_ids).pluck(:group_id)
    groups.each do |group|
      group.joined = !!joined_ids.find { |id| id == group.id }
    end
  end
end
