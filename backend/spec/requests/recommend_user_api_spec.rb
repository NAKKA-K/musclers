require 'rails_helper'

describe 'recommend user api', type: :request do
  describe 'POST #recommend' do
    figures = [0,1,5,10,15,20,25,99]

    before do
      30.times do
        create(:user)
      end

      access_token = User.first.access_token
      @headers = {
        'Authorization' => access_token
      }
    end

    context 'ログインしていなければ401が返る' do
      it 'return status code 401' do
        post recommended_users_api_users_path
        p response.status
        expect(response.status).to eq 401  
      end
    end

    context 'ログインしている' do
      it '体型のみの場合、体型で検索をして20件取得' do
        post recommended_users_api_users_path, params: { figure: figures[Random.rand(0 .. 7)] }, headers: @headers
        p response.status
        p response
        expect(response.status).to eq 200  
      end
  
      it '本気度のみの場合、本気度で検索して20件取得' do
        post recommended_users_api_users_path, params: { seriousness: Random.rand(0..2) }, headers: @headers
        p response.status
        expect(response.status).to eq 200
      end
  
      it '本気度、体型が存在　20件取得' do
        post recommended_users_api_users_path,params: { figure: figures[Random.rand(0 .. 7)],seriousness: Random.rand(0..2) }, headers: @headers
        expect(response.status).to eq 200
      end
  
      it '体型、本気度が送られてこなくてもランダムで20件取得' do
        post recommended_users_api_users_path, headers: @headers
        expect(response.status).to eq 200
      end        
    end

  end
end