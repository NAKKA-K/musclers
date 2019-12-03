require 'rails_helper'

describe 'detail user api', type: :request do
  describe 'GET #show' do
    context 'when user dose not exists' do
      it 'return status code 404' do
        get api_user_path(1)
        expect(response).to have_http_status(404)
        expect(JSON.parse(response.body)['message']).to eq '指定したユーザは存在しません'
      end
    end

    context "when user exists" do
      before do
        @user = create(:user)
      end

      it 'fetch user details' do
        get api_user_path(@user.id)
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)['message']).to eq 'ユーザが見つかりました'
      end
    end
  end
end