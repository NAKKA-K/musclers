require 'rails_helper'

describe 'search user api', type: :request do
  describe 'GET #index' do
    before do
      create_list(:user,30)
    end

    it 'return status code 200' do
      get api_users_path
      expect(response).to have_http_status(200)
    end

    context 'when search users exists' do
      it 'return search users' do
        get api_users_path
        meta = JSON.parse(response.body)['meta']

        total_count = 0
        (1..meta['total_pages']).each do |page_number|
          get api_users_path, params:{ page: page_number }
          search_users = JSON.parse(response.body)
          size = search_users['meta']['size']
          total_count += size

          expect(search_users['data'].count).not_to be > size
          expect(search_users['data'].count).to eq size  
        end

        expect(total_count).to eq meta['total_count']
      end
    end

    context 'when search user not exists' do
      it 'return empty data' do
        get api_users_path, params:{ keywords: "I am GOD" }
        expect(JSON.parse(response.body)['data']).to eq 0
      end
    end
  end
end