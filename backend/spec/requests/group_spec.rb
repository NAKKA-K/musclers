require 'rails_helper'

RSpec.describe "Group", type: :request do
  describe "GET /groups" do
    before do
      access_token = create(:user).access_token
      @headers = {
        'Authorization' => access_token
      }
    end

    context 'when not created group' do
      it 'return empty data & 200' do
        get api_groups_path
        expect(response.status).to eq 200
        res = JSON.parse(response.body)
        expect(res['data']).to be_empty
      end
    end

    context 'when created groups' do
      before do
        create_list(:group, 10)
      end

      it "return created groups" do
        get api_groups_path
        expect(response).to have_http_status(200)

        res = JSON.parse(response.body)
        expect(res['data'].count).to eq 10
      end
    end
  end
end