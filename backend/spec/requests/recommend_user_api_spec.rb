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

    context 'access token not exist into header' do
      it 'return status code 401' do
        post recommended_users_api_users_path
        expect(response.status).to eq 401  
      end
    end

    context 'access token exist into header' do
      it 'search recommended users by figures' do
        post recommended_users_api_users_path,
              params: { 
                figure: figures[Random.rand(0 .. 7)] 
              },
              headers: @headers
        recommend_user_list = JSON.parse(response.body)
        expect(response.status).to eq 200  
        expect(recommend_user_list['data'].count).not_to be > 20
        expect(recommend_user_list['data'].count).to be <= 20
      end
  
      it 'search recommended users by seriousness' do
        post recommended_users_api_users_path,
              params: {
                seriousness: Random.rand(0..2)
              },
              headers: @headers
        recommend_user_list = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(recommend_user_list['data'].count).not_to be > 20
        expect(recommend_user_list['data'].count).to be <= 20
      end
  
      it 'search recommended users by figures and seriousness' do
        post recommended_users_api_users_path,
              params: { figure: figures[Random.rand(0 .. 7)],
                        seriousness: Random.rand(0..2) 
              },
              headers: @headers
        recommend_user_list = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(recommend_user_list['data'].count).not_to be > 20
        expect(recommend_user_list['data'].count).to be <= 20
      end
  
      it 'search recommended users by nothing value' do
        post recommended_users_api_users_path, headers: @headers
        recommend_user_list = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(recommend_user_list['data'].count).not_to be > 20
        expect(recommend_user_list['data'].count).to be <= 20
      end        
    end

  end
end