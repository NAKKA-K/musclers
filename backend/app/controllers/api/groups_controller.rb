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

  def join
    @group = Group.find(params[:id])

    @group.group_users.create(user_id: current_user.id)
    success_res(
        200,
        message: '参加しました',
        data: nil,
    ) and return
  end
end
