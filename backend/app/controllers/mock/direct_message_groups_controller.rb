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
            "send_user_id": current_user.id,
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
            "send_user_id": current_user.id,
            "created_at": "2019-11-19 04:58:55",
            "updated_at": "2019-11-19 04:58:55"
          }
        },
      ]
      success_res(200, message: '[Mock]: 取得しました', data: data) and return
    end

    def show
      user = User.all.limit(1).first
      data = {
        "id": 1,
        "by_user": UserSerializer.new(current_user).as_json,
        "to_user": UserSerializer.new(user).as_json,
        "created_at": "2019-11-19 04:58:55",
        "updated_at": "2019-11-19 04:58:55",
        "direct_messages": [
          {
            "id": 1,
            "body": "Hello, Mr.Muscler!",
            "send_user_id": user.id,
            "created_at": "2019-11-19 04:58:55",
            "updated_at": "2019-11-19 04:58:55"
          },
          {
            "id": 2,
            "body": "Hello, Mr!",
            "send_user_id": current_user.id,
            "created_at": "2019-11-19 04:58:55",
            "updated_at": "2019-11-19 04:58:55"
          },
          {
            "id": 3,
            "body": "Let's workout together quadriceps femoris muscle !! 一緒に大腿四頭筋を鍛えましょう！!",
            "send_user_id": user.id,
            "created_at": "2019-11-19 04:58:55",
            "updated_at": "2019-11-19 04:58:55"
          },
        ]
      }
      success_res(200, message: '[Mock]: 取得しました', data: data) and return
    end

    def create
      if direct_message_params['message'].blank?
        error_res(
          400,
          message: "不正なリクエストです",
          err: "不正なリクエストです"
        ) and return
      end

      data = {
        id: 1,
        body: direct_message_params['message'],
        send_user_id: current_user.id,
        created_at: "2019-11-19 04:58:55",
        updated_at: "2019-11-19 04:58:55"
      }
      success_res(200, message: '[Mock]: 作成しました', data: data) and return
    end

    private

    def direct_message_params
      params.permit(:message)
    end
  end
end
