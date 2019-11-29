module Mock
  class GroupMessagesController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:show]

    def show
      users = User.all.limit(4).to_a

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
      11.times do |i|
        data << {
          "id": i + 1,
          "body": messages[i % messages.size],
          "send_user": UserSerializer.new(users[rand(users.size)]).as_json,
          "created_at": "2019-11-19 04:58:55",
          "updated_at": "2019-11-19 04:58:55"
        }
      end
      success_res(200, message: '[Mock]: 取得しました', data: data) and return
    end
  end
end
