require 'open-uri'
users = [
  {
    data:{
      provider: 'test',
      nickname: '野間 守@最近筋トレ始めました',
      description: '某アニメを見て筋トレを始めました。よろしくお願いしますー',
      age: 21,
      gender: 1,
      height: 178,
      weight: 70,
      figure: 20,
      seriousness: 2,
    },
    thumbnail: 'https://www.pakutaso.com/shared/img/thumb/PAKU6319_TP_V.jpg'
  },
  {
    data:{
      provider: 'test',
      nickname: 'ササミ太郎',
      description: '学生やってまーす。刃牙に出てくる範馬勇次郎に憧れて体を鍛えてます！！',
      age: 19,
      gender: 1,
      height: 176,
      weight: 64,
      figure: 5,
      seriousness: 2,
    },
    thumbnail: 'https://www.pakutaso.com/shared/img/thumb/OOPAKU6485_TP_V.jpg'
  },
  {
    data:{
      provider: 'test',
      nickname: 'ジェームズ@メンズフィジークで優勝したい',
      description: 'フィジークの大会で優勝するため日々体を鍛えてます。食生活でも食事制限をかけています。つらいよー；；',
      age: 24,
      gender: 1,
      height: 165,
      weight: 60,
      figure: 5,
      seriousness: 1,
    },
    thumbnail: 'https://stat.ameba.jp/user_images/20140525/13/midori-an/74/40/j/t02200344_0479075012952205534.jpg?caw=800'
  },
  {
    data:{
      provider: 'test',
      nickname: 'フォレストダイナミック',
      description: 'フォレストダイナミックバスター！！',
      age: 20,
      gender: 1,
      height: 168,
      weight: 50,
      figure: 1,
      seriousness: 2,
    },
    thumbnail: 'https://pbs.twimg.com/media/DmBHrwCUcAAjbyq.jpg'
  },
  {
    data:{
      provider: 'test',
      nickname: '増川 恵@週3でジムに通ってます',
      description: '都内でWebエンジニアやってます。ストレス発散にジムに週三日通ってます。都内の人一緒に筋トレしましょう',
      age: 32,
      gender: 1,
      height: 174,
      weight: 63,
      figure: 5,
      seriousness: 2,
    },
    thumbnail: 'https://pbs.twimg.com/media/DzgMrMAVsAAxnyC.jpg'
  },
  {
    data:{
      provider: 'test',
      nickname: '黒光 剛彦',
      description: 'プロのボディビルダー目指して頑張っております。プロアマ関係なく楽しく筋トレライフを楽しみましょう',
      age: 28,
      gender: 1,
      height: 169,
      weight: 65,
      figure: 10,
      seriousness: 1,
    },
    thumbnail: 'https://www.pakutaso.com/shared/img/thumb/BO151030385007_TP_V4.jpg'
  },
  {
    data:{
      provider: 'test',
      nickname: '笠村 原',
      description: '大学の友達と一緒にジムに通ってます。毎週月、木曜日空いてるので一緒にトレーニングやりませんか？ Titterもやってます:@XXXYYYAAA',
      age: 20,
      gender: 1,
      height: 170,
      weight: 60,
      figure: 5,
      seriousness: 2,
    },
    thumbnail: 'https://www.pakutaso.com/shared/img/thumb/OOK160214510I9A8506_TP_V.jpg'
  },
  {
    data:{
      provider: 'test',
      nickname: '谷向 風人@初心者',
      description: '会社の同僚に誘われて筋トレ始めました。初心者ですがよろしくですー',
      age: 26,
      gender: 1,
      height: 168,
      weight: 57,
      figure: 1,
      seriousness: 2,
    },
    thumbnail: 'https://frestocks.com/wp-content/uploads/2018/02/20171016_frestocks_kbysht_0187.jpg'
  },
  {
    data:{
      provider: 'test',
      nickname: 'エキスパンダー@戸愚呂・弟のような肉体を目指す',
      description: '戸愚呂が俺の憧れ',
      age: 25,
      gender: 1,
      height: 187,
      weight: 80,
      figure: 5,
      seriousness: 1,
    },
    thumbnail: 'http://www.realgym.jp/wordp/wp-content/uploads/2017/04/052-200x300.jpg'
  },
  {
    data:{
      provider: 'test',
      nickname: '沖澤',
      description: '暇なときにトレーニングしてるー',
      age: 23,
      gender: 1,
      height: 162,
      weight: 53,
      figure: 5,
      seriousness: 0,
    },
    thumbnail: 'https://scontent-sea1-1.cdninstagram.com/v/t51.2885-15/sh0.08/e35/s750x750/68765671_378962866115886_6540317063799890795_n.jpg?_nc_ht=scontent-sea1-1.cdninstagram.com&oh=e222989717d0ece898555d55bb8a577b&oe=5DFED125&ig_cache_key=MjEyNjIwNDY0ODA3MDI4NjY2Mg%3D%3D.2'
  },
  {
    data:{
      provider: 'test',
      nickname: 'ケンシロウに憧れた男',
      description: '体鍛えたら北斗神拳使えるようになるのかな',
      age: 22,
      gender: 1,
      height: 171,
      weight: 65,
      figure: 5,
      seriousness: 1,
    },
    thumbnail: 'https://publicdomainq.net/images/201707/13s/publicdomainq-0011084zcg.jpg'
  },
  {
    data:{
      provider: 'test',
      nickname: 'トーマス',
      description: '筋トレ初心者です。目指せシックスパック',
      age: 21,
      gender: 1,
      height: 165,
      weight: 53,
      figure: 20,
      seriousness: 2,
    },
    thumbnail: 'https://www.pakutaso.com/shared/img/thumb/N811_shadowbox_TP_V4.jpg'
  },
  {
    data:{
      provider: 'test',
      nickname: 'マッスルグリル',
      description: '暇な時にジムに行ってトレーニングしてますー',
      age: 21,
      gender: 1,
      height: 175,
      weight: 65,
      figure: 5,
      seriousness: 2,
    },
    thumbnail: 'https://publicdomainq.net/images/201901/30s/publicdomainq-0030909lrn.jpg'
  },
  {
    data:{
      provider: 'test',
      nickname: '椎名 弘子@週4でジム通ってます^^',
      description: '趣味でトレーニングしています！！モチベ上げるために一緒にトレーニングしませんか？',
      age: 21,
      gender: 2,
      height: 161,
      weight: 52,
      figure: 5,
      seriousness: 2,
    },
    thumbnail: 'https://cdn.pixabay.com/photo/2016/11/29/06/15/adult-1867743_1280.jpg'
  },
  {
    data:{
      provider: 'test',
      nickname: '隅屋 心美@女子フィジーク優勝経験あり',
      description: '来月の大会に向けて調整中。頑張るよー',
      age: 26,
      gender: 2,
      height: 163,
      weight: 55,
      figure: 5,
      seriousness: 1,
    },
    thumbnail:
    'https://contents.oricon.co.jp/photo/img/4000/4756/detail/img660/1560129877598.jpg'
  },
  {
    data:{
      provider: 'test',
      nickname: '黒岡 みつき@モデル目指してます',
      description: 'スタイルがよくなりたい！！モデル志望です',
      age: 21,
      gender: 2,
      height: 165,
      weight: 50,
      figure: 20,
      seriousness: 2,
    },
    thumbnail: 'https://www.pakutaso.com/shared/img/thumb/kawamura1029IMGL4424_TP_V4.jpg'
  },
  {
    data:{
      provider: 'test',
      nickname: 'なーちゃん',
      description: 'お腹の脂肪を消すぞ！！友達の誘いでジムに通い始めました。',
      age: 23,
      gender: 2,
      height: 154,
      weight: 51,
      figure: 25,
      seriousness: 2,
    },
    thumbnail: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0uC5WGPcbHE3ZVdjceTtHTHLx9Hj230ki0mSSNYOKlcX2afe8'
  },
  {
    data:{
      provider: 'test',
      nickname: 'さな',
      description: 'ダイエットのためジムに通ってます',
      age: 25,
      gender: 2,
      height: 170,
      weight: 55,
      figure: 15,
      seriousness: 2,
    },
    thumbnail: 'https://publicdomainq.net/images/201803/08s/publicdomainq-0019680qzy.jpg'
  },
  {
    data:{
      provider: 'test',
      nickname: '三阪 紗月',
      description: 'ダイエットのために運動を始めた',
      age: 24,
      gender: 2,
      height: 164,
      weight: 52,
      figure: 25,
      seriousness: 1,
    },
    thumbnail: 'https://www.pakutaso.com/shared/img/thumb/161007-188_TP_V.jpg'
  },
  {
    data:{
      provider: 'test',
      nickname: '福由 萌菜',
      description: '脂肪を筋肉にしたい',
      age: 28,
      gender: 2,
      height: 159,
      weight: 55,
      figure: 25,
      seriousness: 1,
    },
    thumbnail: 'https://publicdomainq.net/images/201803/08s/publicdomainq-0019681inb.jpg'
  },
  {
    data:{
      provider: 'test',
      nickname: '西城 悠那@トレーニング初心者',
      description: '最近とある女優さんに憧れてトレーニング始めました',
      age: 25,
      gender: 2,
      height: 152,
      weight: 47,
      figure: 15,
      seriousness: 1,
    },
    thumbnail: 'https://publicdomainq.net/images/201911/01s/publicdomainq-0039780bnm.jpg'
  }
]
ActiveRecord::Base.transaction do
  users.each do |item|
    item[:data][:uid] = Faker::Number.unique.leading_zero_number(digits: 15)
    item[:data][:access_token] = SecureRandom.urlsafe_base64(15).tr('lIO0', 'sxyz')
    user_record = User.create!(item[:data])
    open(item[:thumbnail]) do |file|
      p "fetching image data from #{item[:thumbnail]}"
      if file.content_type == "image/jpeg"
        user_record.thumbnail.attach(io: file, filename: "sample#{user_record.id}.jpg")
      else
        user_record.thumbnail.attach(io: file, filename: "sample#{user_record.id}.png")
      end
    end
  end
end