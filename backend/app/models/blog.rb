class Blog < ApplicationRecord
    #usersテーブルに従属しているblogsテーブル
    belongs_to :user
    
end
