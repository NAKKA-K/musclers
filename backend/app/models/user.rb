class User < ApplicationRecord
  enum gender:  { not_set: 0, man: 1, woman: 2, other: 3}, _prefix: true
  enum figure:  {
                  not_set: 0,
                  skinny_muscle: 1,
                  normal_muscle: 5,
                  obese_muscle: 10,
                  skinny: 15,
                  normal: 20,
                  obese:25,
                  other: 99
                }, _prefix: true
  enum seriousness: { not_set: 0, gachi:1, enjoy:2}, _prefix: true
end