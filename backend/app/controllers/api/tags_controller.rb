class Api::TagsController < ApplicationController
     #Tagすべての一覧を返すアクション
     def index
        @tags = Tag.all
    end
    
end
