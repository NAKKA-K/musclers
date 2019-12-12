class Api::GroupMembersController < ApplicationController
  def show
    group_members = Group.find(params[:id]).users
    data = ActiveModel::Serializer::CollectionSerializer.new(
      group_members,
      each_serializer: UserSerializer
    ).as_json
    success_res(200, message: 'グループメンバーが見つかりました', data: data) and return
  end
end
