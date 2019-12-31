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
    @group = Group.find_by_id(params[:id])

    if @group.nil?
      error_res(
        404,
        message: "指定したグループは存在しません",
        err: "指定したグループは存在しません"
      ) and return
    end

    success_res(
        200,
        message: '取得しました',
        data: GroupSerializer.new(@group).as_json,
    ) and return
  end

  def create
    builded_params = group_params
    builded_params[:tags] = builded_params[:tags].join(' ') if builded_params[:tags].present?
    group = Group.new(builded_params)
    if group.save
      success_res(
        201,
        message: '作成しました',
        data: GroupSerializer.new(group).as_json,
      ) and return
    else
      error_res(422, message: '入力が正しくありません', err: group.errors.messages) and return
    end
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

  private

  def group_params
    params.permit(:name, :description, :thumbnail, :is_public, tags: [])
  end
end
