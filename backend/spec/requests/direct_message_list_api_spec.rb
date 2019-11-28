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
        create(:user)
        @first_user = User.first
        @headers = {
          'Authorization' => @first_user.access_token
        }  
      end

      it 'return status code 200' do
        get api_direct_message_groups_path, headers: @headers
        expect(response.status).to eq 200
      end

      it 'search direct message list' do
        create_list(:user,2)
        second_user = User.find(@first_user.id + 1)
        third_user = User.find(second_user.id + 1)

        @first_user.by_users.create(to_user_id: second_user.id)
        @first_user.by_users.create(to_user_id: third_user.id)
        
        get api_direct_message_groups_path, headers: @headers
        dm_list = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(dm_list['data'].count).to eq 2
      end
    end
  end
end