module Api
  class InformationController < ApplicationController
    def index
      @information = Information.where(user_id: current_user.id)

      success_res(200, message: '取得しました', data: @information) and return
    end
  end
end
