direct_messages = [
  {
    group_id:1,
    body: [
      {
        send_user:1,
        message: "こんにちは！！一緒に筋肉ライフを楽しみましょう"
      },
      {
        send_user:2,
        message: "初めまして、よろしくお願いします！！"
      },
      {
        send_user:1,
        message: "普段からどれくらい筋トレ等されていますか？"
      }
    ]
  },
  {
    group_id:2,
    body: [
      {
        send_user:3,
        message: "トレーニングやりましょー"
      },
      {
        send_user:1,
        message: "良いですよ、今週の土曜日とか空いてますか？"
      },
      {
        send_user:3,
        message: "空いてます、いつもの場所に朝10時に集まりましょう"
      },
      {
        send_user:1,
        message: "わかりましたー"
      }
    ]
  },
  {
    group_id:3,
    body: [
      {
        send_user:1,
        message: "来週ボディビルの大会があるのですが一緒にみに行きません？"
      },
      {
        send_user:4,
        message: "ごめんなさい、来週は予定が入ってるので行けないです"
      },
      {
        send_user:1,
        message: "そうですか、残念です"
      },
      {
        send_user:1,
        message: "また別日に一緒に行きましょう"
      }
    ]
  }
]

direct_messages.each do |item|
  dm_group_id = item[:group_id]
  item[:body].each do |message|
    DirectMessage.create(send_user_id: message[:send_user],body: message[:message],direct_message_group_id:dm_group_id)
    p "create direct message send_user_id:#{message[:send_user]},direct_message_group_id: #{dm_group_id}"
  end
end
