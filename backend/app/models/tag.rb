class Tag < ApplicationRecord
     has_many :user_tags
     has_many :blog_tags
     has_many :blogs, through: :blog_tags

     enum name: { 
          chubby: 0,
          normal: 1,
          thin: 2,
          macho: 3,
          lean: 4,
          slim: 5,
          health: 6,
          hobby: 7,
          job: 8,
          short_term: 9,
          long_term: 10
     }, _prefix: true
end
