module Mock
  class GroupsController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:index, :show]

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

    def show
      data = {
        "id": 3,
        "name": 'ITエンジニア達の筋活!',
        "description": "筋肉は全てを解決してくれる！筋肉は全てを解決してくれる！筋肉は全てを解決してくれる！筋肉は全てを解決してくれる！筋肉は全てを解決してくれる！筋肉は全てを解決してくれる！筋肉は全てを解決してくれる！筋肉は全てを解決してくれる！筋肉は全てを解決してくれる！",
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
      success_res(200, message: '[Mock]: 取得しました', data: data) and return
    end

    def create
      data = {
        id: 1,
        name: group_params[:name],
        description: group_params[:description],
        is_public: group_params[:is_public],
        thumbnail: "https://i2.wp.com/dietlife25.com/wp-content/uploads/2019/12/274122b394996dcc766774e82f1bdf0e_m.jpg?resize=1280%2C720&ssl=1",
        tags: group_params[:tags].map {|id| mock_tag(id) },
        created_at: "2019-11-19 04:58:55",
        updated_at: "2019-11-19 04:58:55"
      }
      p data
      success_res(201, message: '[Mock]: 作成しました', data: data) and return
    end

    private

    def mock_tag(id)
      {
        "id": id,
        "name": "マッチョ",
        "created_at": "2019-11-19 04:58:55",
        "updated_at": "2019-11-19 04:58:55"
      }
    end

    def group_params
      params.permit(:name, :description, :is_public, tags: [])
    end
  end
end
