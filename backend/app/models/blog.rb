class Blog < ApplicationRecord
    #usersテーブルに従属しているblogsテーブル
    belongs_to :user

    #blog_tagsに使用されるtag_idの設定
    has_many :blog_tags

end
