class Api::DebugController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:index]

  def index
    user = User.first
    p user.access_token
    data = LoggedinUserSerializer.new(user).as_json
    success_res(status, message: 'デバッグユーザです', data: data) and return
  end

end
