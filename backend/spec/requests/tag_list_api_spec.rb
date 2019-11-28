require 'rails_helper'

describe 'tag list api', type: :request do
  describe 'GET #index' do
    it 'return status code 200' do
      get api_tags_path
      expect(response.status).to eq 200
    end

    it 'fetch tag list' do
      create_list(:tag,11)
      get api_tags_path
      tags = JSON.parse(response.body)
      expect(tags['data'].count).to eq 11
    end
  end
end