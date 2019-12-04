class Api::BlogsController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:index, :show]

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

    #ブログの詳細を返すアクション
    def show
        begin
            @blog = Blog.find(params[:id])
            success_res(
                200,
                message: 'ブログ詳細を表示',
                data: @blog,
            ) and return
        
        rescue ActiveRecord::RecordNotFound
            error_res(
                404,
                message: '指定したブログは存在しません',
                err: '指定したブログは存在しません',
            ) and return
        end
    end

end
