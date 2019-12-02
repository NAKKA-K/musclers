require 'rails_helper'

describe 'ブログのAPI', type: :request do
    describe 'すべてのブログの一覧表示機能' do
        context 'ブログが1件もない場合' do
            get api_blogs_path
            blogs = JSON.parse(response.body)
            expect(blogs['message']).to eq 'ブログは投稿されていません'
            expect(blogs['data'].count).to eq 0

        end

        context 'ブログが存在している場合' do
            before do
                @blogs.create!(blog_id: blog.id)

            end
        end
        
            it 'すべてのブログが表示される' do
                get api_blogs_path
                blogs = JSON.parse(response.body)
                expect(blogs['message']).to eq 'ユーザータグ一覧を表示'
                expect(blogs['data'].count).to_not 0
            end
    end
end
