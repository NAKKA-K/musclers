require 'rails_helper'

RSpec.describe "Group", type: :request do
  describe "GET /groups" do
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

  describe "GET /groups/:id" do
    context 'when not created group' do
      it 'return 404' do
        get api_group_path(0)
        expect(response.status).to eq 404
      end
    end

    context 'when created group' do
      before do
        @group = create(:group)
      end

      it "return created group" do
        get api_group_path(@group.id)
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST /groups" do
    context 'when not logged in user' do
      it 'return status code 401' do
        post api_groups_path
        expect(response).to have_http_status(401)
      end
    end

    context 'when logged in user' do
      before do
        access_token = create(:user).access_token
        @headers = {
          'Authorization' => access_token,
          'Content-Type' => 'multipart/form-data'
        }
      end

      it 'create group from params' do
        params = {
          name: 'test',
          description: 'test',
          is_public: true,
          thumbnail: Rack::Test::UploadedFile.new('public/images/noimage.png'),
          tags: ['筋肉質', '趣味'],
        }
        post api_groups_path, params: params, headers: @headers
        expect(response).to have_http_status(201)
      end

      it 'dose not create group from params' do
        post api_groups_path, params: nil, headers: @headers
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "GET /groups/:id/join" do
    context 'when not logged in user' do
      it 'return status code 401' do
        post join_api_group_path(0)
        expect(response).to have_http_status(401)
      end
    end

    context 'when logged in user' do
      before do
        access_token = create(:user).access_token
        @headers = {
          'Authorization' => access_token
        }
      end

      context 'when not exists the group' do
        it 'return status code 404' do
          post join_api_group_path(0), headers: @headers
          expect(response).to have_http_status(404)
        end
      end

      context 'when not exists the group' do
        before do
          @group = create(:group)
        end

        it 'return status code 200' do
          post join_api_group_path(@group.id), headers: @headers
          expect(response).to have_http_status(200)
        end
      end
    end
  end
end
