module Api
  module Auth
    class UserController < ApplicationController
      def myself
        data = LoggedinUserSerializer.new(@current_user).as_json
        success_res(200, message: '自分自身のデータ', data: data) and return
      end
    end
  end
end
