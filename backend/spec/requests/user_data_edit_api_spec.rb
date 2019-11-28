require 'rails_helper'

describe 'user data edit api', type: :request do
  describe 'PATCH #edit' do
    context 'access token not exist into header' do
      it 'return status code 401' do
      end
    end

    context 'access token exist into header' do      
      it 'return status code 200' do

      end

      it 'update user data' do

      end
    end
  end
end