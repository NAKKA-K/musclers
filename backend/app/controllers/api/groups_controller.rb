class Api::GroupsController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:index]

  def index
    @groups = Group.order(created_at: :desc)
    success_res(
        200,
        message: '取得しました',
        data: @groups,
    ) and return
  end

end

