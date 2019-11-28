class Api::BlogsController < ApplicationController
    #ブログ一覧を返すアクション
    #のちにログインしているユーザのブログだけ返すように変更
    def index
        @blogs = Blog.all
        success_res(
            200,
            message: 'ブログ一覧をを表示',
            data: @blogs,
          ) 
    end

end
