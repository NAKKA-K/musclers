require 'rails_helper'

describe 'user data update api', type: :request do
  describe 'PATCH #index' do
    context 'access token not exist into header' do
      it 'return status code 401' do
      end
    end

    context 'access token exist into header' do
      it 'return status code 200' do

      end

      it 'update user nickname & email' do

      end
    end
  end
end