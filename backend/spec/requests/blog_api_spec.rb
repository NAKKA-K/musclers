require 'rails_helper'

describe 'ブログのAPI', type: :request do
    describe 'すべてのブログの一覧表示機能' do
        context 'ブログが1件もない場合' do
            it 'ブログの投稿は0件です' do
                get api_blogs_path
                blogs = JSON.parse(response.body)
                expect(blogs['message']).to eq 'ブログは投稿されていません'
                expect(blogs['data'].count).to eq 0
            end
        end

        context 'ブログが1件以上ある場合' do
            before do
                create(:blog)
            end

            it 'すべてのブログが表示される' do
                get api_blogs_path
                blogs = JSON.parse(response.body)
                expect(blogs['message']).to eq 'ブログ一覧を表示'
                expect(blogs['data'].count).to be > 0
            end
        end
    end

    describe 'ブログの詳細表示機能' do
        context 'ブログが存在しない場合' do
            it 'ブログが存在しません' do
                get api_blog_path(0)
                expect(response).to have_http_status(404)
                expect(JSON.parse(response.body)['message']).to eq '指定したブログは存在しません'
            end
        end

        context 'ブログが存在する場合' do
            before do
                @blog = create(:blog)
            end

            it 'ブログの詳細が表示される' do
                get api_blog_path(@blog.id)
                expect(response).to have_http_status(200)
                expect(JSON.parse(response.body)['message']).to eq 'ブログ詳細を表示'
            end
        end
    end

    describe 'ブログの新規作成機能' do
        before do
            @blog = create(:blog)
            @user = create(:user)
            @params = {
                blog: {
                    title: @blog.title,
                    body: @blog.body,
                    user_id: @user.id
                }
            }
            @headers = {
                'Authorization' => @user.access_token
            }
        end

        context 'ユーザーが非ログイン時の場合' do
            it 'ログインしてしません' do
                post api_blogs_path(@user.id)
                expect(response).to have_http_status(401)
            end
        end
        
        context 'ブログのタイトルが空の場合' do
            it 'ブログのタイトルが空白です' do
                @params[:blog][:title] = " "
                post api_blogs_path(@user.id), params: @params, headers: @headers
                err_data = JSON.parse(response.body)
                expect(response).to have_http_status(422)
                expect(err_data['message']).to eq '入力内容が正しくありません'
                expect(err_data['errors'][0]['message']['title'][0]).to eq 'ブログのタイトルを入力してください'
            end
        end

        context 'ブログの内容が空の場合' do
            it 'ブログの内容が空白です' do
                @params[:blog][:body] = " "
                post api_blogs_path(@user.id), params: @params, headers: @headers
                err_data = JSON.parse(response.body)
                expect(response).to have_http_status(422)
                expect(err_data['message']).to eq '入力内容が正しくありません'
                expect(err_data['errors'][0]['message']['body'][0]).to eq 'ブログの内容を入力してください'
            end
        end

        context 'ブログが新規作成された場合' do
            it 'ブログの新規作成に成功' do
                post api_blogs_path(@user.id), params: @params, headers: @headers
                #@postblog = JSON.parse(response.body)
                #expect{ puts @postblog }.to output(@postblog).to_stdout
                expect(response).to have_http_status(200)
                expect(JSON.parse(response.body)['message']).to eq 'ブログを新規作成しました'
            end
        end

    end

end
