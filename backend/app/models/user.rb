class User < ApplicationRecord
  enum gender:  { Not_set: 0, Man: 1, Woman: 2, Other: 3}, _prefix: true
  enum figure:  {
                  Not_set: 0,
                  Skinny_muscle: 1,
                  Normal_muscle: 5,
                  Obese_muscle: 10,
                  Skinny: 15,
                  Normal: 20,
                  Obese:25,
                  Other: 99
                }, _prefix: true
end
