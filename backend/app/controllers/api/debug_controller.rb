class Api::DebugController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if Rails.env === 'production'
      error_res(401, err: 'デバッグ環境ではありません') and return
    end

    user = User.first
    authenticate user
    if sign_in?
      data = LoggedinUserSerializer.new(user).as_json
      success_res(200, message: 'デバッグユーザです', data: data) and return
    else
      error_res(401, err: '認証に失敗しました') and return
    end

  end

end
