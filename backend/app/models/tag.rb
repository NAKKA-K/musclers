class Tag < ApplicationRecord
     #UserTagに使用されるtag_idのFK設定
     has_many :user_tags
     
     #blog_tagsに使用されるtag_idの設定
     has_many :blog_tags
end
