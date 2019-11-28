# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

# ボディビルダー、フィジーカー、サマスタ、ベスボで検索
thumbnails = [
  'http://livedoor.blogimg.jp/zzcj/imgs/3/b/3b905779.jpg',
  'http://fanblogs.jp/bodybuilder/file/iris20kyle.jpg',
  'https://stat.ameba.jp/user_images/20140525/13/midori-an/74/40/j/t02200344_0479075012952205534.jpg?caw=800',
  'http://www.premium-fit.co.jp/wp-content/uploads/2019/07/A1A16F49-4AA5-4A12-BDD6-90F4AF9082F8.jpeg',
  'https://pbs.twimg.com/media/DzgMrMAVsAAxnyC.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9r64ro0L5SWPQZp5b9qHQWZd5PglUFQabc4nsoUyHd_R2q2qm',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9nM1kkw3TkFlLmj3WabZl2v6fg5J5Lc_iw1ooLx89tLZXIzG-',
  'https://rr.img.naver.jp/mig?src=http%3A%2F%2Fup.gc-img.net%2Fpost_img_web%2F2012%2F12%2F7af4ad6f2df9e96c4f185a67e7e28650_0.jpeg&twidth=1000&theight=0&qlt=80&res_format=jpg&op=r',
  'http://www.realgym.jp/wordp/wp-content/uploads/2017/04/052-200x300.jpg',
  'https://scontent-sea1-1.cdninstagram.com/v/t51.2885-15/sh0.08/e35/s750x750/68765671_378962866115886_6540317063799890795_n.jpg?_nc_ht=scontent-sea1-1.cdninstagram.com&oh=e222989717d0ece898555d55bb8a577b&oe=5DFED125&ig_cache_key=MjEyNjIwNDY0ODA3MDI4NjY2Mg%3D%3D.2',
  'https://contents.oricon.co.jp/photo/img/4000/4756/detail/img660/1560129877598.jpg',
  'http://20hours-performanceworkout.com/wp-content/uploads/2019/05/Top-naked-macho.jpg.pagespeed.ce.sclwlAKBbT.jpg',
  'https://pbs.twimg.com/media/DmBHrwCUcAAjbyq.jpg',
  'https://i.pinimg.com/originals/b4/b0/6e/b4b06ef5acf1b5c68b69ee1f19fc5dac.png',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0uC5WGPcbHE3ZVdjceTtHTHLx9Hj230ki0mSSNYOKlcX2afe8',
  'https://publicdomainq.net/images/201901/30s/publicdomainq-0030909lrn.jpg',
  'https://publicdomainq.net/images/201909/18s/publicdomainq-0038379fjs.jpg',
  'https://publicdomainq.net/images/201706/21s/publicdomainq-0010336luo.jpg',
  'https://publicdomainq.net/images/201804/17s/publicdomainq-0021100kyq.jpg',
  'https://publicdomainq.net/images/201707/13s/publicdomainq-0011084zcg.jpg',
  'https://publicdomainq.net/images/201802/17s/publicdomainq-0018995ela.jpg',
  'https://publicdomainq.net/images/201911/01s/publicdomainq-0039769xtq.jpg',
  'https://publicdomainq.net/images/201908/25s/publicdomainq-0037666cog.jpg',
  'https://publicdomainq.net/images/201908/19s/publicdomainq-0037473uae.jpg',
  'https://publicdomainq.net/images/201911/01s/publicdomainq-0039774lvj.jpg',
  'https://publicdomainq.net/images/201911/01s/publicdomainq-0039771zmf.jpg',
  'https://publicdomainq.net/images/201902/23s/publicdomainq-0031748ava.jpg',
  'https://publicdomainq.net/images/201612/04s/publicdomainq-0003420xwo.jpg',
  'https://publicdomainq.net/images/201711/27s/publicdomainq-0016034jhw.jpg',
  'https://publicdomainq.net/images/201609/20s/publicdomainq-0000816arx.jpg',
  'https://publicdomainq.net/images/201911/01s/publicdomainq-0039775muz.jpg'
]

figures = [0,1,5,10,15,20,25,99]

ActiveRecord::Base.transaction do
  30.times do |i|
    user = {
      provider: 'test',
      uid: Faker::Number.unique.leading_zero_number(digits: 15),
      nickname: Faker::Name.name,
      description: Faker::Lorem.sentence(word_count: Faker::Number.number(digits: 2)),
      age: Faker::Number.number(digits: 2),
      gender: Faker::Number.between(from: 0, to: 3),
      height: Faker::Number.number(digits: 3),
      weight: Faker::Number.between(from: 1, to: 120),
      figure: figures[Random.rand(0 .. 7)],
      seriousness: Faker::Number.between(from: 0, to: 2),
    }
    user_record = User.create!(user)
    open(thumbnails[i]) do |file|
      p "fetching image data from #{thumbnails[i]}"
      if file.content_type == "image/jpeg"
        user_record.thumbnail.attach(io: file, filename: "sample#{i}.jpg")
      else
        user_record.thumbnail.attach(io: file, filename: "sample#{i}.png")
      end
    end
  end
end

tag = ["chubby", "normal", "thin", "macho", "lean", "slim", "health", "hobby", "job", "short_term", "long_term"]
tag.each do |item|
  Tag.create(name: item)
end
