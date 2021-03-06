class User < ApplicationRecord
  include Confirmable

  attr_accessor :is_friends

  has_many :group_users, :dependent => :destroy
  has_many :groups,through: :group_users, :dependent => :destroy
  has_many :group_messages, :dependent => :destroy
  has_many :user_tags
  has_many :blogs, :dependent => :destroy
  has_many :friends
  has_many :followings,
            through: :friends,
            source: :target,
            :dependent => :destroy
  has_many :by_users,
            class_name: "DirectMessageGroup",
            foreign_key: :by_user_id,
            :dependent => :destroy
  has_many :to_users,
            class_name: "DirectMessageGroup",
            foreign_key: :to_user_id,
            :dependent => :destroy
  has_many :send_users,
            class_name: "DirectMessage",
            foreign_key: :send_user_id,
            :dependent => :destroy
  has_many :information, :dependent => :destroy
  has_one_attached :thumbnail

  #モデル側でのNicknameとEmailの正しい値か判定
  validates :email, uniqueness: true, allow_blank: true, format: { with: URI::MailTo::EMAIL_REGEXP}
  validates :nickname, length: { maximum: 64}
  validates :description, length: { maximum: 1024}
  enum gender:  { none: 0, man: 1, woman: 2, other: 3}, _prefix: true
  enum figure:  {
                  none: 0,
                  skinny_muscle: 1,
                  normal_muscle: 5,
                  obese_muscle: 10,
                  skinny: 15,
                  normal: 20,
                  obese:25,
                  other: 99
                }, _prefix: true
  enum seriousness: { none: 0, gachi:1, enjoy:2}, _prefix: true

  scope :where_unique_user, ->(uid:, provider:) { where(uid: uid, provider: provider) }

  scope :search_by_keywords_or_all, ->(keywords) do
    return all if keywords.blank?

    keywords = keywords.split.map { |val| "%#{val}%" }
    where('nickname ILIKE ANY (array[?])', keywords)
      .or(User.where('description ILIKE ANY (array[?])', keywords))
  end

  scope :where_seriousness_or_all, ->(seriousness) { where(seriousness: seriousness) if seriousness.present? }
  scope :where_gender_or_all, ->(gender) { where(gender: gender) if gender.present? }
  scope :where_figures_or_all, ->(figures) { where(figure: figures) if figures.present? }
  scope :where_between_age_or_all, ->(ageMin, ageMax) {
    where(age: (ageMin ||= 0)...(ageMax ||= 999)) if ageMin.present? || ageMax.present?
  }
  scope :where_between_weight_or_all, ->(weightMin, weightMax) {
    where(weight: (weightMin ||= 0)...(weightMax ||= 999)) if weightMin.present? || weightMax.present?
  }
  scope :where_between_height_or_all, ->(heightMin, heightMax) {
    where(height: (heightMin ||= 0)...(heightMax ||= 999)) if heightMin.present? || heightMax.present?
  }
  scope :search_random_users_limit, ->(number) {
    order(Arel.sql("RANDOM()"))
    .limit(number)
    .with_attached_thumbnail
  }
  scope :search_recommend_users_by_figure_and_seriousness, ->(figure, seriousness,number) {
    where_figures_or_all(figure)
    .or(where_seriousness_or_all(seriousness))
    .order(Arel.sql("RANDOM()"))
    .limit(number)
    .with_attached_thumbnail
  }

  scope :search_recommend_users_by_figure, ->(figure,number) {
    where_figures_or_all(figure)
    .order(Arel.sql("RANDOM()"))
    .limit(number)
    .with_attached_thumbnail
  }

  scope :search_recommend_users_by_seriousness, ->(seriousness,number) {
    where_seriousness_or_all(seriousness)
    .order(Arel.sql("RANDOM()"))
    .limit(number)
    .with_attached_thumbnail
  }

  def self.fetch_users(user_ids)
    where(id: user_ids).with_attached_thumbnail
  end

  def self.fetch_recommend_users_in(params)
    recommend_user_list = []
    figure = params[:figure].present? ? params[:figure] : nil
    seriousness = params[:seriousness].present? ? params[:seriousness] : nil
    if figure.present? & seriousness.present?
      recommend_user_list += User.search_recommend_users_by_figure_and_seriousness(figure,seriousness,20)
      fetch_random_users(recommend_user_list)
    elsif figure.present? & seriousness.blank?
      recommend_user_list += User.search_recommend_users_by_figure(figure,20)
      fetch_random_users(recommend_user_list)
    elsif figure.blank? & seriousness.present?
      recommend_user_list += User.search_recommend_users_by_seriousness(seriousness,20)
      fetch_random_users(recommend_user_list)
    else
      recommend_user_list += User.search_random_users_limit(20)
      recommend_user_list
    end
  end

  def self.fetch_user_detail_from(user_id, auth_id:)
    user = User.find_by(id: user_id)
    User.set_friend_flag_to(users: [user], auth_id: auth_id)
    user
  end

  def self.search_user_in(params, auth_id:)
    # TODO: Sprint1の段階ではキーワードを無視して検索
    page = params[:page] ? params[:page] : 1
    per_page = params[:per_page] ? params[:per_page] : 20
    users = User.page(page).per(per_page)
      .search_by_keywords_or_all(params[:keywords])
      .where_seriousness_or_all(params[:seriousness])
      .where_gender_or_all(params[:gender])
      .where_figures_or_all(params[:figures])
      .where_between_age_or_all(params[:ageMin], params[:ageMax])
      .where_between_weight_or_all(params[:weightMin], params[:weightMax])
      .where_between_height_or_all(params[:heightMin], params[:heightMax])
      .with_attached_thumbnail

    User.set_friend_flag_to(users: users, auth_id: auth_id)
    users
  end

  def self.find_for_oauth(auth)
    User.where_unique_user(uid: auth[:uid], provider: auth[:provider]).first_or_initialize
  end

  private

  def self.fetch_random_users(recommend_user_list)
    list_count = recommend_user_list.count
    if list_count < 20
      recommend_user_list += User.search_random_users_limit(20 - list_count)
    end
    recommend_user_list
  end

  def self.set_friend_flag_to(users:, auth_id:)
    # HACK: eagerloadでやる方法がついぞ分からなかったため自分で実装
    # ログイン中のユーザーがユーザーに友達申請しているか判定するflagを追加
    user_ids = users.map(&:id)
    friends = Friend
      .where(user_id: auth_id, target_id: user_ids)
      .or(Friend.where(user_id: user_ids, target_id: auth_id))
    users.each do |user|
      user.is_friends = !!friends.find { |friend| friend.user_id == user.id || friend.target_id == user.id }
    end
  end
end
