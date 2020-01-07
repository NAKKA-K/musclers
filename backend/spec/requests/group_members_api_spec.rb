require 'rails_helper'

describe 'group members api', type: :request do
  describe 'GET #show' do
    context 'not logged in user' do
      it 'return status code 404' do
        get api_group_users_path(0)
        expect(response.status).to eq 404
      end
    end

    context 'when search group member by group_id' do
      before do
        access_token = create(:user).access_token
        @headers = {
          'Authorization' => access_token
        }
        @group = create(:group)
        users = create_list(:user,3)
        users.each do |user|
          GroupUser.create!(user_id:user.id,group_id:@group.id)
        end
      end

      it 'return group members data' do
        get api_group_users_path(@group.id)
        expect(response).to have_http_status(200)
        data = JSON.parse(response.body)
        expect(data['message']).to eq 'グループメンバーが見つかりました'
        expect(data['data']['users'].count).to eq 3
      end
    end
  end
end
