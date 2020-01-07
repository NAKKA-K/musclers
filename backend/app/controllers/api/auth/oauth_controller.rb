module Api
  module Auth
    class OauthController < ApplicationController
      skip_before_action :authenticate_user!

      def facebook
        callback_from(:facebook)
      end

      private

      def callback_from(provider)
        @user = User.find_for_oauth(auth_params)

        status = 200
        if @user.new_record?
          @user.nickname = auth_params[:nickname].blank? ? "" : auth_params[:nickname]
          @user.email = auth_params[:email].blank? ? "" : auth_params[:email]
          status = 201

          begin
            @user.save!
          rescue => e
            logger.error(e)
            error_res(500, err: '認証に失敗しました') and return
          end
        end

        authenticate @user
        if sign_in?
          data = LoggedinUserSerializer.new(@user).as_json
          success_res(status, message: '認証されました', data: data) and return
        else
          error_res(401, err: '認証に失敗しました') and return
        end
      end

      def auth_params
        params.permit(:provider, :uid, :nickname, :email)
      end
    end
  end
end
