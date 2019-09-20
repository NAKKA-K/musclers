module Api
  class UsersController < ApplicationController
    skip_before_action :authenticate_user_from_token!

    def index
      render json: { message:"I'm index." }
    end

    def search
      search_keyword = params[:nickname]
      search_result_data = User.search_user_in(search_keyword)
      response_search_result_json = make_search_result_json(search_result_data)
      render json: response_search_result_json
    end

    def show
      user_id = params[:id]
      user_detail = User.fetch_user_detail_from(user_id)
      response_user_detail_json = make_user_detail_json(user_detail)
      render json: response_user_detail_json
    end

    def create
      render json: { message:"I'm create." }
    end

    def update
      render json: { message:"I'm update." }
    end

    def destroy
      render json: { message:"I'm destroy." }
    end

    private

    def make_user_detail_json(user_detail)
      if user_detail.nil?
        {
          code: 404,
          errors: [
            {
              message: "指定したユーザは存在しません"
            },
          ],
        }
      else
        {
          code: 200,
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
          code: 404,
          message: "お探しのユーザが見つかりませんでした",
          errors: [
            {
              message: "お探しのユーザが見つかりませんでした"
            },
          ],
        }
      else
        {
          code: 200,
          message: "Success",
          data: search_result_data
        }
      end
    end

  end
end
