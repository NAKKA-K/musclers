class Tag < ApplicationRecord
     #　UserTagに使用されるtag_idのFK設定
     has_many :user_tags
     
end
