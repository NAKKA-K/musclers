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
    def show
        @user_tags = current_user.user_tags
        success_res(
            200, 
            message: 'ユーザータグ一覧を表示する', 
            data: @user_tags
        ) and return

        #current_userが空ならエラー
        if current_user.nil?
            error_res(
                401, 
                message: 'ログインされていません',
                err: 'ログインされていません'
            ) and return
        end
    end

end
