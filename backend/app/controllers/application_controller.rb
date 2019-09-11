class ApplicationController < ActionController::API
  # ログイン用のトークンを生成し、ログインしたユーザーを返す
  def sign_in(user)
    user.update_access_token!
    @current_user = user
  end

  def authenticated?
    !!@current_user
  end

  # ログイン中のユーザーを返す
  def current_user
    @current_user ||= authenticate
  end

  # トークン生成済みのユーザーのみ認証する
  def authenticate
    token = request.env['Authorization']
    # TODO: 今後、トークンの失効期限をもうけたい場合、トークン生成時を記録し、以下のユーザー取得時に時間の比較をする
    User.find_by(access_token: token)
  end

  def success_res(status, message: nil, data: nil)
    render json: {
      status: status,
      message: message,
      data: data
    }

  end

  def error_res(status, message: nil, err: nil)
    render json: {
      status: status,
      message: message,
      errors: [
        { message: err }
      ],
      data: nil
    }
  end
end
