require 'rails_helper'

RSpec.describe "DirectMessage", type: :request do
  describe "GET /direct_message_groups/:id" do
    context 'when logged in user' do
      let(:from_user) { create(:user) }
      let(:headers) { { 'Authorization' => from_user.access_token } }
      let(:target_user) { create(:user) }
      let(:direct_message_group) { from_user.by_users.create(to_user: target_user) }

      before do
        direct_message_group.direct_messages.create!(send_user: from_user, body: 'hello')
        direct_message_group.direct_messages.create!(send_user: from_user, body: 'world')
        direct_message_group.direct_messages.create!(send_user: target_user, body: '!')
      end

      it 'return direct_messaegs in direct_message_group' do
        get api_direct_message_group_path(direct_message_group.id), headers: headers
        expect(response).to have_http_status(200)
      end

      it 'return direct messages' do
        get api_direct_message_group_path(direct_message_group.id), headers: headers
        body = JSON.parse(response.body)
        expect(body['data']['direct_messages'].count).to eq 3
      end
    end
  end
end
