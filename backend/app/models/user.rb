class User < ApplicationRecord
  enum gender:  { not_set: 0, man: 1, woman: 2, other: 3}, _prefix: true
  enum figure:  {
                  not_set: 0,
                  skinny_muscle: 1,
                  normal_muscle: 5,
                  obese_muscle: 10,
                  skinny: 15,
                  normal: 20,
                  obese:25,
                  other: 99
                }, _prefix: true
  enum seriousness: { not_set: 0, gachi:1, enjoy:2}, _prefix: true

  def self.fetch_user_detail_from(user_id)
    User.find_by(id:user_id)
  end

  def self.search_user_in(search_keyword)
    #Sprint1の段階ではキーワードを無視して検索
    User.all
  end
end