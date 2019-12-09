require 'rails_helper'

describe 'debug login api', type: :request do
  describe 'GET #index' do
    context 'when user success sign in' do
      before do
        create(:user)
      end
      it 'return status code 200' do
        get api_debug_login_path
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)['message']).to eq 'デバッグユーザです'
      end
    end
  end
end