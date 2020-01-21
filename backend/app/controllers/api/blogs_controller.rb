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

   #ブログの新先登録アクション
   def create
        #例外判定
        begin
            #Blogオブジェクトの作成時にuser_idを付与する
            @blog = Blog.create!(blog_params.merge(user_id: current_user.id))
            #正しく作成
            success_res(
                200,
                message: 'ブログを新規作成しました',
            ) and return
        rescue ActiveRecord::NotNullViolation => e
            #バリデーションエラー
            error_res(
                400, 
                message: '値を入力してください',
                err: '値を入力してください',
            ) and return
        rescue ActiveRecord::RecordInvalid => e
            error_res(
                422, 
                message: "入力内容が正しくありません",
                err: e.record.errors 
            ) and return
        rescue => e
            logger.error(e)
            error_res(
                500, 
                message: '新規作成に失敗しました',
                err: '新規作成に失敗しました',
            ) and return
        end
    end

    private

    #送られてきたデータを正しく受け取るためのメソッド
    def blog_params
        params.fetch(:blog, {}).permit(:title, :body)

    end


end
