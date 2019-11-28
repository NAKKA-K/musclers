require 'rails_helper'

RSpec.describe "Information", type: :request do
  describe "GET /information" do
    before do
      access_token = create(:user).access_token
      @headers = {
        'Authorization' => access_token
      }
    end

    context 'not logged in user' do
      it 'return status code 401' do
        get api_information_index_path
        expect(response.status).to eq 401
      end
    end

    it "works! (now write some real specs)" do
      get api_information_index_path, headers: @headers
      expect(response).to have_http_status(200)
    end

    it "mock works! (now write some real specs)" do
      get mock_information_index_path, headers: @headers
      expect(response).to have_http_status(200)
    end
  end
end
