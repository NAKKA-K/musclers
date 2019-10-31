class UserTag < ApplicationRecord
    #参照されている側のFK設定(belong_to)
    #has_one:１対１
    belong_to: user

    #has_mony：１対多
    belong_to: tag

end
