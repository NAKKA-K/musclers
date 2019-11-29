class Tag < ApplicationRecord
     #UserTagに使用されるtag_idのFK設定
     has_many :user_tags
     #blog_tagsに使用されるtag_idの設定
     has_many :blog_tags
     #blogsテーブルとblog_tagsテーブルを通じて紐づけ
     has_many :blogs, through: :blog_tags
     
end
