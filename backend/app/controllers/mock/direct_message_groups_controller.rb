module Mock
  class DirectMessageGroupsController < ApplicationController
    def index
      user = User.all.limit(1).first
      data = [
        {
          "id": 1,
          "by_user": UserSerializer.new(current_user).as_json,
          "to_user": UserSerializer.new(user).as_json,
          "created_at": "2019-11-19 04:58:55",
          "updated_at": "2019-11-19 04:58:55",
          "latest_message": {
            "id": 1,
            "body": "君はもうバッチリ筋肉追い込んだかい！！？",
            "created_at": "2019-11-19 04:58:55",
            "updated_at": "2019-11-19 04:58:55"
          }
        },
        {
          "id": 2,
          "by_user": UserSerializer.new(current_user).as_json,
          "to_user": UserSerializer.new(user).as_json,
          "created_at": "2019-11-19 04:58:55",
          "updated_at": "2019-11-19 04:58:55",
          "latest_message": {
            "id": 1,
            "body": "君はもうバッチリ筋肉追い込んだかい！！？",
            "created_at": "2019-11-19 04:58:55",
            "updated_at": "2019-11-19 04:58:55"
          }
        },
      ]
      success_res(200, message: '[Mock]: 取得しました', data: data) and return
    end
  end
end
