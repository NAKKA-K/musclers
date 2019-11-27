module Mock
  class InformationController < ApplicationController
    def index
      @information = Information.where(user_id: current_user.id)

      success_res(200, message: '[Mock]: 取得しました', data: @information) and return
    end
  end
end
