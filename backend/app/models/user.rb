class User < ApplicationRecord
  has_one_attached :thumbnail
  validates :email, uniqueness: true, allow_blank: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :nickname, length: { maximum: 64}
  validates :description, length: { maximum: 1024}
  enum gender:  { not_set: 0, man: 1, woman: 2, other: 3}, _prefix: true
  enum figure:  {
                  not_set: 0,
                  skinny_muscle: 1,
                  normal_muscle: 5,
                  obese_muscle: 10,
                  skinny: 15,
                  normal: 20,
                  obese:25,
                  other: 99
                }, _prefix: true
  enum seriousness: { not_set: 0, gachi:1, enjoy:2}, _prefix: true

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


  def self.fetch_user_detail_from(user_id)
    User.find_by(id: user_id)
  end

  def self.search_user_in(params)
    # TODO: Sprint1の段階ではキーワードを無視して検索
    page = params[:page] ? params[:page] : 1
    per_page = params[:per_page] ? params[:per_page] : 20
    User.page(page).per(per_page)
      .search_by_keywords_or_all(params[:keywords])
      .where_seriousness_or_all(params[:seriousness])
      .where_gender_or_all(params[:gender])
      .where_figures_or_all(params[:figures])
      .where_between_age_or_all(params[:ageMin], params[:ageMax])
      .where_between_weight_or_all(params[:weightMin], params[:weightMax])
      .where_between_height_or_all(params[:heightMin], params[:heightMax])
      .with_attached_thumbnail
  end

  def self.find_for_oauth(auth)
    User.where_unique_user(uid: auth[:uid], provider: auth[:provider]).first_or_initialize
  end


  def update_access_token!
    self.access_token = generate_friendly_token
    self.save!
  end

  # (by devise gem) constant-time comparison algorithm to prevent timing attacks
  def secure_token_compare(token)
    a = self.access_token
    b = token

    return false if a.blank? || b.blank? || a.bytesize != b.bytesize
    l = a.unpack "C#{a.bytesize}"

    res = 0
    b.each_byte { |byte| res |= byte ^ l.shift }
    res == 0
  end

  private

  # トークンに使用されるランダムな文字列を生成する
  def generate_friendly_token
    SecureRandom.urlsafe_base64(15).tr('lIO0', 'sxyz')
  end

end
