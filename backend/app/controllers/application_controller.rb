class ApplicationController < ActionController::API
  before_action :authenticate_user_from_token!

  # トークン生成済みのユーザーのみ認証する
  def authenticate_user_from_token!
    user = authenticate_user_from_token
    if user
      @current_user = user
    else
      error_res(401, message: '認証失敗しました')
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

  def success_res(status, message: nil, data: nil, meta: nil)
    render status: status, json: {
      status: status,
      message: message,
      data: data,
      meta: meta,
    }
  end

  def error_res(status, message: nil, err: nil)
    render status: status, json: {
      status: status,
      message: message,
      errors: [
        { message: err }
      ],
      data: nil
    }
  end

  def make_paginator_meta(obj)
    {
      total_pages: obj.total_pages,
      total_count: obj.total_count,
      size: obj.size,
      current_page: obj.current_page,
      next_page: obj.next_page,
      prev_page: obj.prev_page,
      is_first_page: obj.first_page?,
      is_last_page: obj.last_page?,
    }
  end

end
