class Api::BlogsController < ApplicationController
    #すべてのブログの一覧を返すアクション
    def index
        @blogs = Blog.order(created_at: :desc).all
        success_res(
            200,
            message: 'ブログ一覧を表示',
            data: @blogs,
        ) and return
    end

end
