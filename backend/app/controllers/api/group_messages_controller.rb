class Api::GroupMessagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    data = Group.preload(:group_messages).find(params[:group_id])
    success_res(
      200,
      message: '取得しました',
      data: GroupMessageListSerializer.new(data).as_json
    ) and return
  end
end
