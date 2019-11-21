module Mock
  class GroupsController < ApplicationController

    def index
      data = []
      names = ['筋肉モンスターの集会所', 'ゴリラ教団', 'ITエンジニア達の筋活!']
      10.times do |i|
        data << {
          "id": i + 1,
          "name": names[i % 3],
          "description": "筋肉は全てを解決してくれる！筋肉は全てを解決してくれる！筋肉は全てを解決してくれる！筋肉は全てを解決してくれる！筋肉は全てを解決してくれる！筋肉は全てを解決してくれる！筋肉は全てを解決してくれる！",
          "is_public": true,
          "thumbnail": "https://i2.wp.com/dietlife25.com/wp-content/uploads/2019/12/274122b394996dcc766774e82f1bdf0e_m.jpg?resize=1280%2C720&ssl=1",
          "tags": [
            {
              "id": 1,
              "name": "マッチョ",
              "created_at": "2019-11-19 04:58:55",
              "updated_at": "2019-11-19 04:58:55"
            },
            {
              "id": 2,
              "name": "人生",
              "created_at": "2019-11-19 04:58:55",
              "updated_at": "2019-11-19 04:58:55"
            },
            {
              "id": 3,
              "name": "エンジニア",
              "created_at": "2019-11-19 04:58:55",
              "updated_at": "2019-11-19 04:58:55"
            }
          ],
          "created_at": "2019-11-19 04:58:55",
          "updated_at": "2019-11-19 04:58:55"
        }
      end
      success_res(200, message: '[Mock]: 取得しました', data: data) and return
    end
  end
end
