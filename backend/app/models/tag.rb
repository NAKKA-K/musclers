class Tag < ApplicationRecord
     #　UserTagに使用されるtag_idのFK設定
     has_mony: user_tags
     
end
