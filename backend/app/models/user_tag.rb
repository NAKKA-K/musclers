class UserTag < ApplicationRecord
    #参照されている側のFK設定(belongs_to)
    #has_one:１対１
    belongs_to :user

    #has_many：１対多
    belongs_to :tag

end
