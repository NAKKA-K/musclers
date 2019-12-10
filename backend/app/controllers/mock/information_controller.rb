module Mock
  class InformationController < ApplicationController
    def index
      data = 10.times.map do |i|
        {
          id: i,
          type: rand_genre,
          by_name: '筋肉モンスターたちの集会所',
          link: '/groups/1',
          is_read: false,
          user_id: current_user.id,
          thumbnail: "https://i2.wp.com/dietlife25.com/wp-content/uploads/2019/12/274122b394996dcc766774e82f1bdf0e_m.jpg?resize=1280%2C720&ssl=1",
          created_at: "2019-11-19 04:58:55",
          updated_at: "2019-11-19 04:58:55",
        }
      end

      success_res(200, message: '[Mock]: 取得しました', data: data) and return
    end

    private

    def rand_genre
      Information.genres_i18n.to_a[rand(4)][1]
    end
  end
end
