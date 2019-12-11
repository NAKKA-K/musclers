require 'rails_helper'

RSpec.describe "Friend", type: :request do
  describe "POST /user/friends" do
    context 'when not logged in user' do
      it 'return status code 401' do
        post api_friends_path
        expect(response).to have_http_status(401)
      end
    end

    context 'when logged in user' do
      before do
        access_token = create(:user).access_token
        @headers = {
          'Authorization' => access_token
        }
      end

      context 'when not exists the target user' do
        it 'return status code 404' do
          post api_friends_path, headers: @headers, params: { user_id: 0 }
          expect(response).to have_http_status(404)
        end
      end

      context 'when not exists the target user' do
        before do
          @target = create(:user)
        end

        it 'return status code 201' do
          post api_friends_path, headers: @headers, params: { user_id: @target.id }
          expect(response).to have_http_status(201)
        end

        it 'create information from friend request' do
          expect {
            post api_friends_path, headers: @headers, params: { user_id: @target.id }
          }.to change{ Information.count }.by(1)
        end

        it 'conflict second and subsequent request' do
          post api_friends_path, headers: @headers, params: { user_id: @target.id }
          expect(response).to have_http_status(201)
          post api_friends_path, headers: @headers, params: { user_id: @target.id }
          expect(response).to have_http_status(409)
        end
      end
    end
  end
end
