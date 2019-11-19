class Api::TagsController < ApplicationController
     #Tagすべての一覧を返すアクション
     def index
        @tags = Tag.all
        {
            "status": 200,
            "message": "タグ一覧を表示しました",
            "data": @tags
        }
    end
    
    #ユーザーが持っているタグを返す
    def user_tags
        @user_tags = current_user.user_tags
        {
            "status": 200,
            "message": "ユーザータグ一覧を表示しました",
            "data": @user_tags
        }
    end

end
