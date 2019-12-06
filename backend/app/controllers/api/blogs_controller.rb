class Api::BlogsController < ApplicationController
    skip_before_action :authenticate_user_from_token!

    #すべてのブログの一覧を返すアクション
    def index
        @blogs = Blog.order(created_at: :desc).all
        if @blogs.blank?
            success_res(
              200,
              message: 'ブログは投稿されていません',
              data: [],
            ) and return
        else
            success_res(
                200,
                message: 'ブログ一覧を表示',
                data: @blogs,
            ) and return
        end
    end

end
