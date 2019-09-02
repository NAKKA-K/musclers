class User < ApplicationRecord
  enum gender: { "男性": 1, "女性": 2, "その他": 3 }
  enum figure:  {
                  "痩せ型筋肉質": 1,
                  "普通筋肉質": 5,
                  "肥満型筋肉質": 10,
                  "痩せ型": 15,
                  "普通": 20,
                  "肥満型":25,
                  "その他": 99
                }
end
