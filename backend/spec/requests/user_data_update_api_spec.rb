require 'rails_helper'

describe 'user data update api', type: :request do
  describe 'patch #update' do
    before do
      @user = create(:user)
      @headers = {
        'Authorization' => @user.access_token
      }
    end

    context 'not logged in user' do
      it 'return status code 401' do
        patch api_user_path(@user.id)
        expect(response).to have_http_status(401)
      end
    end

    context 'when user exists' do
      context 'and when update fails' do
        it 'raise ActiveRecord::NotNullViolation' do
          patch api_user_path(@user.id),headers: @headers
          err_data = JSON.parse(response.body)
          expect(response).to have_http_status(400)
          expect(err_data['message']).to eq '値を入力してください'
          expect(err_data['errors'][0]['message']).to eq '値を入力してください'
        end
      end

      context 'and when success update' do
        it 'return status code 200' do
          patch api_user_path(@user.id),
                params: { nickname: "hugahoge" , email: "huga@hoge.com" },
                headers: @headers
          expect(response).to have_http_status(200)
          expect(JSON.parse(response.body)['message']).to eq 'ニックネームとEメールを更新しました'
        end
      end

      context 'and when nickname exceeds 64 characters' do
        it 'raise ActiveRecord::RecordInvalid' do
          patch api_user_path(@user.id),
                params: {
                  nickname: 'a'*65,
                  email: "huga@hoge.com"
                },
                headers: @headers
          err_data = JSON.parse(response.body)
          expect(response).to have_http_status(422)
          expect(err_data['message']).to eq '入力内容が正しくありません'
          expect(err_data['errors'][0]['message']['nickname'][0]).to eq '名前が長すぎます。64文字以内で入力してください'
        end
      end

      context 'and when not in email format' do
        it 'raise ActiveRecord::RecordInvalid' do
          patch api_user_path(@user.id),
                params: {
                  nickname: "huga",
                  email: "hogeeeeee"
                },
                headers: @headers
          err_data = JSON.parse(response.body)
          expect(response).to have_http_status(422)
          expect(err_data['message']).to eq '入力内容が正しくありません'
          expect(err_data['errors'][0]['message']['email'][0]).to eq 'Eメールの形式で入力してください'
        end
      end

    end

    context 'when user dose not exist' do
      it 'return staus code 404' do
        patch api_user_path(0),
              params: { nickname: "hugahoge" , email: "huga@hoge.com" },
              headers: @headers
        expect(response).to have_http_status(404)
        expect(JSON.parse(response.body)['message']).to eq 'ユーザが存在しません'
      end
    end

  end
end