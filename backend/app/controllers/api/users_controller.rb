module Api
  class UsersController < ApplicationController
    def index
      render json: { message:"I'm index." }
    end

    def search
      search_keyword = params[:nickname]
      search_result_data = User.search_user_in(search_keyword)
      if search_result_data.blank?
        error_res(
          404,
          message: "お探しのユーザは見つかりませんでした",
          err: "お探しのユーザは見つかりませんでした"
        ) and return
      else
        success_res(200, message: 'ユーザが見つかりました', data: search_result_data) and return
      end
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
        success_res(200, message: 'ユーザが見つかりました', data: user_detail) and return
      end
    end

    def create
      render json: { message:"I'm create." }
    end

    def update
      begin
        @user = User.find(params[:id])
        @user.update!(email: params[:email])
        success_res(200, message: 'Eメールを更新しました') and return
      rescue ActiveRecord::RecordNotFound
        error_res(404, err: 'ユーザが存在しません') and return
      rescue ActiveRecord::RecordInvalid => e
        error_res(400, err: e.record.errors) and return
      rescue
        error_res(500, err: '更新に失敗しました') and return
      end
    end

    def destroy
      render json: { message:"I'm destroy." }
    end

  end
end
