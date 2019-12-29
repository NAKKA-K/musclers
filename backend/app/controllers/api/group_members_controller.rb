class Api::GroupMembersController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:show]

  def show
    begin
      group_members = Group.preload(:users).find(params[:group_id])
    rescue ActiveRecord::RecordNotFound
      error_res(
          404,
          message: '指定したグループは存在しません',
          err: '指定したグループは存在しません',
      ) and return
    end

    data = GroupMemberSerializer.new(group_members).as_json
    success_res(200, message: 'グループメンバーが見つかりました', data: data) and return
  end
end
