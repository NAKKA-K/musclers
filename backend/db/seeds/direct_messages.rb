messages = [
  {
    group_id:1
    message: [
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
    group_id:2
    message: [
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
    group_id:3
    message: [
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
ActiveRecord::Base.transaction do
  test_user = User.first
  DirectMessageGroup.where(by_user_id: test_user.id).each do |dm_group|
    p "create direct message direct_message_group_id: #{dm_group.id}"
    DirectMessage.create(send_user_id:?,body: ?,direct_message_group_id:?)
    test_user.send_users.create!(
      body: Faker::Lorem.sentence(word_count: Faker::Number.number(digits: 2)),
      direct_message_group_id: dm_group.id
    )
  end
end
