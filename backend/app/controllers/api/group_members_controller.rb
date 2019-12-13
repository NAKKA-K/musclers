class Api::GroupMembersController < ApplicationController
  def show
    group_members = Group.preload(:users).find(params[:group_id])
    data = GroupMemberSerializer.new(group_members).as_json
    success_res(200, message: 'グループメンバーが見つかりました', data: data) and return
  end
end
