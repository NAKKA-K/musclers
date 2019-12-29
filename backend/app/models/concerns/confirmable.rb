module Confirmable
  extend ActiveSupport::Concern

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
