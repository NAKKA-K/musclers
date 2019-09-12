module Api
  module Auth
    class OauthController < ApplicationController
      skip_before_action :authenticate_user_from_token!

      def facebook
        callback_from(:facebook)
      end

      private

      def callback_from(provider)
        begin
          @user = User.find_for_oauth(auth_params)
        rescue => e
          logger.error(e)
          error_res(500, err: '認証に失敗しました') and return
        end

        authenticate @user
        if sign_in?
          data = LoggedinUserSerializer.new(@user).as_json
          success_res(200, message: '認証されました', data: data) and return
        else
          error_res(401, err: '認証に失敗しました') and return
        end
      end

      def auth_params
        params.permit(:provider, :uid, :email)
      end
    end
  end
end
