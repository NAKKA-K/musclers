class User < ApplicationRecord
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


  def self.fetch_user_detail_from(user_id)
    User.find_by(id:user_id)
  end

  def self.search_user_in(search_keyword)
    # TODO: Sprint1の段階ではキーワードを無視して検索
    User.all
  end

  def self.find_for_oauth(auth)
    User.where(uid: auth[:uid], provider: auth[:provider]).first_or_initialize
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
