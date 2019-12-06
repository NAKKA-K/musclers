class Api::TagsController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:index]

  #Tagすべての一覧を返すアクション
  def index
    @tags = Tag.all
    data = ActiveModel::Serializer::CollectionSerializer.new(
      @tags,
      each_serializer: TagSerializer
    ).as_json

    success_res(
      200,
      message: 'タグ一覧を表示',
      data: data,
    )
  end

  #ユーザーが持っているタグを返す
  def show
    #current_userが空ならエラー
    if current_user.nil?
      error_res(
        401,
        message: 'ログインされていません',
        err: 'ログインされていません',
      ) and return
    end

    #ユーザーが持っているタグがある、ない場合の処理
    @user_tags = current_user.user_tags
    if @user_tags.blank?
      success_res(
        200,
        message: 'タグが登録されていません',
        data: [],
      ) and return
    else
      success_res(
        200,
        message: 'ユーザータグ一覧を表示',
        data: @user_tags,
      ) and return
    end
  end

end
