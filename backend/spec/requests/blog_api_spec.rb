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

end
