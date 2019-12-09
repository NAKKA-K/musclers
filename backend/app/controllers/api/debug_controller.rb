class Api::DebugController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:index]

  def index
    user = User.first
    authenticate user

    unless Rails.env === 'development'
      error_res(401, err: 'デバッグ環境ではありません') and return
    end

    if sign_in?
      data = LoggedinUserSerializer.new(user).as_json
      success_res(200, message: 'デバッグユーザです', data: data) and return
    else
      error_res(401, err: '認証に失敗しました') and return
    end

  end

end
