direct_message_groups = DirectMessageGroup.limit(3)

direct_messages = [
  {
    direct_message_group_id: direct_message_groups[0].id,
    messages: [
      {
        send_user_id: direct_message_groups[0].by_user_id,
        body: "こんにちは！！一緒に筋肉ライフを楽しみましょう",
      },
      {
        send_user_id: direct_message_groups[0].to_user_id,
        body: "初めまして、よろしくお願いします！！",
      },
      {
        send_user_id: direct_message_groups[0].by_user_id,
        body: "普段からどれくらい筋トレ等されていますか？",
      }
    ]
  },
  {
    direct_message_group_id: direct_message_groups[1].id,
    messages: [
      {
        send_user_id: direct_message_groups[1].to_user_id,
        body: "トレーニングやりましょー",
      },
      {
        send_user_id: direct_message_groups[1].by_user_id,
        body: "良いですよ、今週の土曜日とか空いてますか？",
      },
      {
        send_user_id: direct_message_groups[1].to_user_id,
        body: "空いてます、いつもの場所に朝10時に集まりましょう",
      },
      {
        send_user_id: direct_message_groups[1].by_user_id,
        body: "わかりましたー",
      }
    ]
  },
  {
    direct_message_group_id: direct_message_groups[2].id,
    messages: [
      {
        send_user_id: direct_message_groups[2].by_user_id,
        body: "来週ボディビルの大会があるのですが一緒にみに行きません？",
      },
      {
        send_user_id: direct_message_groups[2].to_user_id,
        body: "ごめんなさい、来週は予定が入ってるので行けないです",
      },
      {
        send_user_id: direct_message_groups[2].by_user_id,
        body: "そうですか、残念です",
      },
      {
        send_user_id: direct_message_groups[2].by_user_id,
        body: "また別日に一緒に行きましょう",
      }
    ]
  }
]

ActiveRecord::Base.transaction do
  direct_messages.each do |dm|
    direct_message_group_id = dm[:direct_message_group_id]
    dm[:messages].each do |msg|
      msg.store(:direct_message_group_id, direct_message_group_id)
      obj = DirectMessage.create!(msg)
      p "create direct message group_id: #{direct_message_group_id}, id: #{obj.id}"
    end
  end
end
