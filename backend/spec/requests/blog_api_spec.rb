require 'rails_helper'

describe 'ブログのAPI', type: :request do
  describe 'すべてのブログの一覧表示機能' do
    context 'ブログが1件もない場合' do
        it 'ブログの件であることを表示する' do
            expect(page).to have_content 'ブログ0件'
        end
    end

    context 'ブログが存在している場合' do
        it 'すべてのブログが表示される' do
            expect(page).to have_content '新しいブログ'
        end
    end

  end
end