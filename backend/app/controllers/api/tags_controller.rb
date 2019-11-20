class Api::TagsController < ApplicationController
     #Tagすべての一覧を返すアクション
     def index
        @tags = Tag.all
        succress_res(
            200,
            message: 'タグ一覧を表示'
            data: @tags
        )
    end
    
    #ユーザーが持っているタグを返す
    def show
        #current_userが空ならエラー
        if current_user.nil?
            error_res(
                401, 
                message: 'ログインされていません',
                err: 'ログインされていません'
            ) and return
        end

        #ユーザーが持っているタグがある、ない場合の処理
        if current_user.user_tags.nil?
            error_res(
                404,
                message: 'タグが登録されていません'
                err: 'タグが登録されていません'
            ) and return
            
        else
            @user_tags = current_user.user_tags
            success_res(
                200, 
                message: 'ユーザータグ一覧を表示', 
                data: @user_tags
            ) and return
        end
            
    end

end
