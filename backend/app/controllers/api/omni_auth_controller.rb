module Api
  class OmniAuthController < DeviseTokenAuth::OmniauthCallbacksController
    def facebook
      callback_from(:facebook)
    end

    private

    def callback_from(provider)
      begin
        logger.debug(request.env['omniauth.auth'])
        @user = User.find_for_oauth(request.env['omniauth.auth'])
      rescue => e
        logger.error(e)
        error_res(500, err: '認証できませんでした') and return
      end

      sign_in @user
      if user_signed_in?
        success_res(200, message: '認証されました') and return
      else
        error_res(500, err: '認証できませんでした') and return
      end
    end

  end
end
