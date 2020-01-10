groups = Group.limit(4).map{|item| [item.id,item.users.pluck(:id)]}
group_messages = [
  {
    group_id: groups[0][0],
    messages:[
      {
        body: 'こんちはー',
        user_id: groups[0][1][0],
        group_id: groups[0][0]
      },
      {
        body: 'よろしくお願いします！！',
        user_id: groups[0][1][1],
        group_id: groups[0][0]
      },
      {
        body: '一緒にトレーニング楽しみましょうね',
        user_id: groups[0][1][2],
        group_id: groups[0][0]
      }
    ]
  },
  {
    group_id: groups[1][0],
    messages:[
      {
        body: '昨日は忙しすぎて筋トレできなかったから今日はやりたいなー',
        user_id: groups[1][1][0],
        group_id: groups[1][0]
      },
      {
        body: '今日暇だからジム行こー',
        user_id: groups[1][1][1],
        group_id: groups[1][0]
      },
      {
        body: '私もついていく',
        user_id: groups[1][1][2],
        group_id: groups[1][0]
      },
      {
        body: 'オーケー、じゃあ夕方くらいに集まろー',
        user_id: groups[1][1][0],
        group_id: groups[1][0]
      }
    ]
  },
  {
    group_id: groups[2][0],
    messages:[
      {
        body: '今週の土日暇な人一緒にトレーニングしよー',
        user_id: groups[2][1][0],
        group_id: groups[2][0]
      },
      {
        body: 'いいよー',
        user_id: groups[2][1][1],
        group_id: groups[2][0]
      },
      {
        body: 'ごめん！！予定が入ってる',
        user_id: groups[2][1][2],
        group_id: groups[2][0]
      },
      {
        body: 'どこでやるー？',
        user_id: groups[2][1][1],
        group_id: groups[2][0]
      },
    ]
  },
  {
    group_id: groups[3][0],
    messages:[
      {
        body: '筋肉痛やばいいいいいい',
        user_id: groups[3][1][0],
        group_id: groups[3][0]
      },
      {
        body: 'ワロタ、安静にしときな',
        user_id: groups[3][1][1],
        group_id: groups[3][0]
      },
      {
        body: 'ゆっくり休みなー',
        user_id: groups[3][1][2],
        group_id: groups[3][0]
      }
    ]
  },
]

ActiveRecord::Base.transaction do
  group_messages.each do |item|
    item[:messages].each do |msg|
      GroupMessage.create!(msg)
      p "create group message group_id: #{item[:group_id]}, data: #{msg}"
    end
  end
end