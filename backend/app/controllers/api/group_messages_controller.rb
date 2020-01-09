class Api::GroupMessagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    data = GroupMessage.preload(:user).where(group_id: params[:group_id])
    success_res(
      200,
      message: '取得しました',
      data: ActiveModel::Serializer::CollectionSerializer.new(
        data,
        each_serializer: GroupMessageSerializer
      ).as_json
    ) and return
  end
end
