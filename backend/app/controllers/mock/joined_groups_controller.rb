module Mock
  class JoinedGroupsController < ApplicationController
    def index
      names = ['筋肉モンスターの集会所', 'ゴリラ教団', 'ITエンジニア達の筋活!']
      messages = [
        'お願いマッスル めっちゃモテたい！お願いマッスル めっちゃ痩せたい、YES！',
        'ウー！(キレてるよ！) ハー！(キレてるよ！)',
        'ヒップレイズ！サイドベント！腹筋6LDKかい！',
        'ダンベルカール！ハンマーカール！二頭が良いね！チョモランマ！',
        'プッシュアップ！ベンチプレス！ 大胸筋が歩いてる！仕上がってるよ！仕上がってるよ！ 筋肉本舗！はいズドーン！',
        '理想の自分を思い描いたら 今すぐ始めよ！トレーニング！イエス、マッスル！',
        'ヤバめの現実何とかなるはず ダンベル両手にフリーウェイト！(ナイスマッチョ！)',
        '焦りは禁物、無理しちゃ沈没 負荷のかけ方を調節！(そう、筋肉！)',
        '限界10回ギリギリ全開！ 3セットしたらオーライ！(ナイスポーズ！)',
        '辛いこともある筋肉道(筋肉道) モテモテボディがほしいの！ 奇麗なワタシに大変身(大変身) 見てなさい！(さい？)さい！(さい？？)',
        'はい、サイドチェストーーー！',
      ]

      data = []
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
          "updated_at": "2019-11-19 04:58:55",
          "latest_message": {
            "id": 1,
            "body": messages[i % messages.size],
            "send_user_id": current_user.id,
            "created_at": "2019-11-19 04:58:55",
            "updated_at": "2019-11-19 04:58:55"
          },
        }
      end
      success_res(200, message: '[Mock]: 取得しました', data: data) and return
    end
  end
end

