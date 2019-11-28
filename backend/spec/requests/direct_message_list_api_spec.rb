require 'rails_helper'

describe 'direct message list api', type: :request do
  describe 'GET #index' do
    context 'access token not exist into header' do
      it 'return status code 401' do
        get api_direct_message_groups_path
        expect(response.status).to eq 401
      end
    end

    context 'access token exist into header' do
      before do
        @user = create(:user)
        @headers = {
          'Authorization' => @user.access_token
        }  
      end

      it 'return status code 200' do
        get api_direct_message_groups_path, headers: @headers
        expect(response.status).to eq 200
      end

      it 'search direct message list' do
        users = create_list(:user,2)

        @user.by_users.create(to_user_id: users[0].id)
        @user.by_users.create(to_user_id: users[1].id)
        
        get api_direct_message_groups_path, headers: @headers
        dm_list = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(dm_list['data'].count).to eq 2
      end
    end
  end
end