direct_messages = [
  {
    messages: [
      {
        send_user_id:1,
        body: "こんにちは！！一緒に筋肉ライフを楽しみましょう",
        direct_message_group_id:1
      },
      {
        send_user_id:2,
        body: "初めまして、よろしくお願いします！！",
        direct_message_group_id:1
      },
      {
        send_user_id:1,
        body: "普段からどれくらい筋トレ等されていますか？",
        direct_message_group_id:1
      }
    ]
  },
  {
    messages: [
      {
        send_user_id:3,
        body: "トレーニングやりましょー",
        direct_message_group_id:2
      },
      {
        send_user_id:1,
        body: "良いですよ、今週の土曜日とか空いてますか？",
        direct_message_group_id:2
      },
      {
        send_user_id:3,
        body: "空いてます、いつもの場所に朝10時に集まりましょう",
        direct_message_group_id:2
      },
      {
        send_user_id:1,
        body: "わかりましたー",
        direct_message_group_id:2
      }
    ]
  },
  {
    messages: [
      {
        send_user_id:1,
        body: "来週ボディビルの大会があるのですが一緒にみに行きません？",
        direct_message_group_id:3
      },
      {
        send_user_id:4,
        body: "ごめんなさい、来週は予定が入ってるので行けないです",
        direct_message_group_id:3
      },
      {
        send_user_id:1,
        body: "そうですか、残念です",
        direct_message_group_id:3
      },
      {
        send_user_id:1,
        body: "また別日に一緒に行きましょう",
        direct_message_group_id:3
      }
    ]
  }
]

direct_messages.each do |item|
  item[:messages].each do |message|
    DirectMessage.create(message)
    p "create direct message send_user_id:#{message[:send_user_id]},direct_message_group_id: #{message[:direct_message_group_id]}"
  end
end
