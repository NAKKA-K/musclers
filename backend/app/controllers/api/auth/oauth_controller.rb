module Api
  module Auth
    class OauthController < ApplicationController
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

        sign_in @user
        if user_signed_in?
          # TODO: access_tokenを返す
          success_res(200, message: '認証されました', data: @user) and return
        else
          error_res(401, err: '認証に失敗しました') and return
        end
      end

      def auth_params
        params.require(:auth).permit(:provider, :uid, :email)
      end
    end
  end
end
