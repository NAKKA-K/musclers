require 'rails_helper'

describe 'tag list api', type: :request do
  describe 'GET #index' do
    context 'access token not exist into header' do
      it 'return status code 401' do
      end
    end

    context 'access token exist into header' do
      it 'return status code 200' do

      end

      it 'fetch tag list' do

      end
    end
  end
end