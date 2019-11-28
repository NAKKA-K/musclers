require 'rails_helper'

describe 'detail user api', type: :request do
  describe 'POST #show' do
    context 'access token not exist into header' do
      it 'return status code 401' do
      end
    end

    context 'access token exist into header' do
      it 'return status code 200' do

      end
  
      it 'fetch user details' do

      end
    end
  end
end