require 'rails_helper'

describe 'user tag api', type: :request do
  describe 'GET #show' do
    before do
      @test_user = create(:user)
      @headers = {
        'Authorization' => @test_user.access_token
      }
    end

    context 'when access token not exist into header' do
      it 'return status code 401' do
        get api_tag_path(@test_user.id)
        expect(response).to have_http_status(401)
      end
    end

    context 'when access token exist into header' do
      it 'return status code 200' do
        get api_tag_path(@test_user.id), headers: @headers
        expect(response).to have_http_status(200)
      end
    end

    context 'when user have not tags' do
      it 'return empty data' do
        get api_tag_path(@test_user.id), headers: @headers
        user_tags = JSON.parse(response.body)
        expect(user_tags['message']).to eq 'タグが登録されていません'
        expect(user_tags['data'].count).to eq 0
      end
    end

    context 'when user have tags' do
      before do
        create_list(:tag,11).each do |tag|
          @test_user.user_tags.create!(tag_id: tag.id)
        end
      end

      it 'return user tags' do
        get api_tag_path(@test_user.id), headers: @headers
        user_tags = JSON.parse(response.body)
        expect(user_tags['message']).to eq 'ユーザータグ一覧を表示'
        expect(user_tags['data'].count).to eq 11
      end
    end
  end
end