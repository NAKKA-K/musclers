class Api::FriendsController < ApplicationController
  def requestFriend
    @user = User.find_by_id(params[:user_id])
    if @user.nil?
      error_res(
        404,
        message: "指定したユーザーは存在しません",
        err: "指定したユーザーは存在しません"
      ) and return
    end

    begin
      current_user.friends.create(target: @user)
    rescue ActiveRecord::RecordNotUnique
      error_res(
        409,
        message: "すでに申請しています",
        err: "すでに申請しています"
      ) and return
    end

    success_res(
        201,
        message: '友達申請しました',
        data: nil,
    ) and return
  end
end
