module Authenticatable
  extend ActiveSupport::Concern

  # トークン生成済みのユーザーのみ認証する
  def authenticate_user_from_token!
    user = authenticate_user_from_token
    if user
      @current_user = user
    else
      raise Exceptions::AuthenticationError
    end
  end

  def authenticate_user_from_token
    token = request.headers['Authorization']
    # TODO: 今後、トークンの失効期限をもうけたい場合、トークン生成時を記録し、以下のユーザー取得時に時間の比較をする
    user = User.find_by(access_token: token)

    if user && user.secure_token_compare(token)
      user
    else
      nil
    end
  end

  # ログイン用のトークンを生成し、サインインし、ログインしたユーザーを返す
  def authenticate(user)
    user.update_access_token!
    @current_user = user
  end

  def sign_in?
    !!@current_user
  end

  # ログイン中のユーザーを返す
  def current_user
    @current_user ||= authenticate_user_from_token
  end
end
