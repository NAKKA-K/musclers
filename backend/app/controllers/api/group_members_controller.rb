class Api::GroupMembersController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:show]

  def show
    group_members = Group.preload(:users).find(params[:group_id])
    data = GroupMemberSerializer.new(group_members).as_json
    success_res(200, message: 'グループメンバーが見つかりました', data: data) and return
  end
end
