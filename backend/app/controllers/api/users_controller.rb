module Api
  class UsersController < ApplicationController
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
          data: user_detail
        }
      end
    end

    def make_search_result_json(search_result_data)
      if search_result_data.blank?
        {
<<<<<<< HEAD
          code: 404,
          message: "お探しのユーザが見つかりませんでした",
=======
          status: 404,
>>>>>>> 3de0c5b63258a78611f9d82f25b42655dad49127
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
