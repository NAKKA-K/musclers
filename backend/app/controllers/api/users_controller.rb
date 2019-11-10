module Api
  class UsersController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:search, :show]

    def index
      render json: { message:"I'm index." }
    end

    def search
      search_result_data = User.search_user_in(search_params)

      data = ActiveModel::Serializer::CollectionSerializer.new(
        search_result_data,
        each_serializer: UserSerializer
      ).as_json
      meta = make_paginator_meta(search_result_data)
      success_res(200, message: 'ユーザが見つかりました', data: data, meta: meta) and return
    end

    def show
      user_id = params[:id]
      user_detail = User.fetch_user_detail_from(user_id)

      if user_detail.nil?
        error_res(
          404,
          message: "指定したユーザは存在しません",
          err: "指定したユーザは存在しません"
        ) and return
      else
        data = UserSerializer.new(user_detail).as_json
        success_res(200, message: 'ユーザが見つかりました', data: data) and return
      end
    end

    def update
      begin
        @user = User.find(params[:id])
        @user.update!(email: params[:email])
        success_res(200, message: 'Eメールを更新しました') and return
      rescue ActiveRecord::RecordNotFound
        error_res(404, message: 'ユーザが存在しません',err: 'ユーザが存在しません') and return
      rescue ActiveRecord::RecordInvalid => e
        error_res(422, message: '入力内容が正しくありません',err: e.record.errors) and return
      rescue => e
        logger.error(e)
        error_res(500, message: '更新に失敗しました',err: '更新に失敗しました') and return
      end
    end

    def edit
      begin
        edit_data = enum_params_to_integer(user_params)
        @user = User.find(params[:id])
        @user.update!(edit_data)
        success_res(200, message: 'ユーザ情報を更新しました') and return
      rescue ActiveRecord::RecordNotFound
        error_res(404, message: 'ユーザが存在しません',err: 'ユーザが存在しません') and return
      rescue ActiveRecord::RecordInvalid => e
        error_res(422, message: '入力内容が正しくありません',err: e.record.errors) and return
      rescue => e
        logger.error(e)
        error_res(500, message: '更新に失敗しました',err: '更新に失敗しました') and return
      end
    end

    private

    def search_params
      params.permit(
        :page,
        :per_page,
        :keywords,
        :seriousness,
        :gender,
        :figures,
        :ageMin,
        :ageMax,
        :weightMin,
        :weightMax,
        :heightMin,
        :heightMax
      )
    end

    def user_params
      params.require(:user).permit(
        :nickname,
        :description,
        :age,
        :gender,
        :height,
        :weight,
        :figure,
        :muscle_mass,
        :body_fat_percentage,
        :seriousness,
        :email,
        :thumbnail
      )
    end

    def enum_params_to_integer(user_params)
      enum_params = ["gender","figure","seriousness"]
      enum_params.each do |key|
        user_params[key] = user_params[key].to_i
      end

      user_params
    end
  end
end
