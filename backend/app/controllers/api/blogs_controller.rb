class Api::BlogsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]

    #すべてのブログの一覧を返すアクション
    def index
        @blogs = ActiveModel::Serializer::CollectionSerializer.new(
          Blog.preload(:tags).order(created_at: :desc).all,
          each_serializer: BlogSerializer
        ).as_json
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
            @blog = Blog.preload(:tags).find(params[:id])
            success_res(
                200,
                message: 'ブログ詳細を表示',
                data: BlogSerializer.new(@blog).as_json,
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
