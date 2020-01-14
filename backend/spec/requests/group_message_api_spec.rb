require 'rails_helper'

RSpec.describe "GroupMessage", type: :request do
  describe "GET /groups/:group_id/messages" do
    let(:users) { create_list(:user,3) }
    let(:headers) { { 'Authorization' => users[0].access_token } }
    let(:group) { create(:group) }

    before do
      users.each do |user|
        group.group_users.create!(user_id: user.id)
      end
      group.group_messages.create!(body: 'hello',user_id: users[0].id)
      group.group_messages.create!(body: 'world',user_id: users[1].id)
      group.group_messages.create!(body: '!!',user_id: users[2].id)
    end

    it 'return group_messaegs in group' do
      get api_group_messages_path(group.id), headers: headers
      expect(response).to have_http_status(200)
    end

    it 'return group messages' do
      get api_group_messages_path(group.id), headers: headers
      body = JSON.parse(response.body)
      expect(body['data'].count).to eq 3
    end
  end
end
