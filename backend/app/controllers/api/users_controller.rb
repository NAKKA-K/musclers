module Api
  class UsersController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:search, :show]

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
        error_res(404, message: 'ユーザが存在しません',err: 'ユーザが存在しません') and return
      rescue ActiveRecord::RecordInvalid => e
        error_res(422, message: '入力内容が正しくありません',err: e.record.errors) and return
      rescue => e
        logger.error(e)
        error_res(500, message: '更新に失敗しました',err: '更新に失敗しました') and return
      end
    end

    def destroy
      render json: { message:"I'm destroy." }
    end

    private

    def make_user_detail_json(user_detail)
      if user_detail.nil?
        {
          status: 404,
          errors: [
            {
              message: "指定したユーザは存在しません"
            },
          ],
        }
      else
        {
          status: 200,
          message: "Success",
          data: {
            id: user_detail.id,
            nickname: user_detail.nickname,
            thumbnail: user_detail.thumbnail,
            description: user_detail.description,
            age: user_detail.age,
            gender: user_detail.gender_i18n,
            height: user_detail.height,
            weight: user_detail.weight,
            figure: user_detail.figure_i18n,
            muscle_mass: user_detail.muscle_mass,
            body_fat_percentage: user_detail.body_fat_percentage,
            created_at: user_detail.created_at,
            updated_at: user_detail.updated_at,
            seriousness: user_detail.seriousness_i18n
          }
        }
      end
    end

    def make_search_result_json(search_result_data)
      if search_result_data.blank?
        {
          status: 404,
          errors: [
            {
              message: "お探しのユーザが見つかりませんでした"
            },
          ],
        }
      else
        {
          status: 200,
          message: "Success",
          data: search_result_data
        }
      end
    end
  end
end
