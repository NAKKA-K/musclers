module Api
  class UsersController < ApplicationController
    def index
      render json: { message:"I'm index." }
    end

    def show
      #ユーザ詳細
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
          data: user_detail
        }
      end
    end
  end
end