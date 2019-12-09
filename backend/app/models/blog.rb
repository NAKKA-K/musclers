class Blog < ApplicationRecord
    #モデルの検証
    validates :title, presence: true
    validates :body, presence: true

    #usersテーブルに従属しているblogsテーブル
    belongs_to :user
    #blog_tagsに使用されるtag_idの設定
    has_many :blog_tags
    #tagsテーブルはblog_tagsを通じて紐づけ
    has_many :tags, through: :blog_tags
    #サムネ画像
    has_one_attached :thumbnail

end
