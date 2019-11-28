class BlogTag < ApplicationRecord
    #blogsテーブルに従属している
    belongs_to :blog
    #tagsテーブルに従属している
    belongs_to :tag
    
end
