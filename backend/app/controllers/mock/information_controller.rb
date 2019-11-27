module Mock
  class InformationController < ApplicationController
    def index
      data = []

      10.times.map do |i|
        {
          id: i,
          type: random(4),
          by_name: '筋肉モンスターたちの集会所',
          link: '/groups/1',
          is_read: false,
          user_id: current_user.id,
          created_at: "2019-11-19 04:58:55",
          updated_at: "2019-11-19 04:58:55",
        }
      end

      success_res(200, message: '[Mock]: 取得しました', data: data) and return
    end
  end
end
