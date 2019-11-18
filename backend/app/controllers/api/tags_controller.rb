class Api::TagsController < ApplicationController
     #Tagすべての一覧を返すアクション
     def index
        @tags = Tag.all
        {
            "status": 200,
            "message": "タグ一覧を表示しました",
            "data": {
                Tag.all(@tags)
            }
        }
    end
    
end
