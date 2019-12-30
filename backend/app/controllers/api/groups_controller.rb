class Api::GroupsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @groups = ActiveModel::Serializer::CollectionSerializer.new(
      Group.order(created_at: :desc),
      each_serializer: GroupSerializer
    ).as_json

    success_res(
        200,
        message: '取得しました',
        data: @groups,
    ) and return
  end

  def show
    @group = Group.find(params[:id])

    success_res(
        200,
        message: '取得しました',
        data: GroupSerializer.new(@group).as_json,
    ) and return
  end

  def join
    @group = Group.find_by_id(params[:id])

    if @group.nil?
      error_res(
        404,
        message: "指定したグループは存在しません",
        err: "指定したグループは存在しません"
      ) and return
    end

    begin
      @group.group_users.create(user_id: current_user.id)
    rescue ActiveRecord::RecordNotUnique
      error_res(
        409,
        message: "すでに参加しています",
        err: "すでに参加しています"
      ) and return
    end

    success_res(
        200,
        message: '参加しました',
        data: nil,
    ) and return
  end
end
