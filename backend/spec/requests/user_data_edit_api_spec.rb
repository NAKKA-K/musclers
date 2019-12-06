require 'rails_helper'

describe 'user data edit api', type: :request do
  describe 'patch #edit' do
    before do
      @user = create(:user)
      @params = {
        user: {
          nickname: @user.nickname,
          description: @user.description,
          age: @user.age,
          gender: @user.gender,
          height: @user.height,
          weight: @user.weight,
          figure: @user.figure,
          muscle_mass: @user.muscle_mass,
          body_fat_percentage: @user.muscle_mass,
          seriousness: @user.seriousness,
          email: @user.email
        }
      }
      @headers = {
        'Authorization' => @user.access_token
      }
    end

    context 'not logged in user' do
      it 'return status code 401' do
        patch edit_api_user_path(@user.id)
        expect(response).to have_http_status(401)
      end
    end

    context 'when user exists' do
      context 'and when nickanme is null' do
        it 'raise ActiveRecord::NotNullViolation' do
          @params[:user][:nickname] = nil
          patch edit_api_user_path(@user.id),params: @params,headers: @headers
          err_data = JSON.parse(response.body)
          expect(response).to have_http_status(400)
          expect(err_data['message']).to eq '値を入力してください'
          expect(err_data['errors'][0]['message']).to eq '値を入力してください'
        end
      end

      context 'and when success update' do
        it 'return status code 200' do
          patch edit_api_user_path(@user.id),params: @params,headers: @headers
          expect(response).to have_http_status(200)
          expect(JSON.parse(response.body)['message']).to eq 'ユーザ情報を更新しました'
        end
      end

      context 'and when nickname exceeds 64 characters' do
        it 'raise ActiveRecord::RecordInvalid' do
          @params[:user][:nickname] = 'a'*65
          patch edit_api_user_path(@user.id),params: @params,headers: @headers
          err_data = JSON.parse(response.body)
          expect(response).to have_http_status(422)
          expect(err_data['message']).to eq '入力内容が正しくありません'
          expect(err_data['errors'][0]['message']['nickname'][0]).to eq '名前が長すぎます。64文字以内で入力してください'
        end
      end

      context 'and when not in email format' do
        it 'raise ActiveRecord::RecordInvalid' do
          @params[:user][:email] = "hugaaaaa"
          patch edit_api_user_path(@user.id),params: @params,headers: @headers
          err_data = JSON.parse(response.body)
          expect(response).to have_http_status(422)
          expect(err_data['message']).to eq '入力内容が正しくありません'
          expect(err_data['errors'][0]['message']['email'][0]).to eq 'Eメールの形式で入力してください'
        end
      end

    end

    context 'when user dose not exist' do
      it 'return staus code 404' do
        patch edit_api_user_path(0),params: @params,headers: @headers
        expect(response).to have_http_status(404)
        expect(JSON.parse(response.body)['message']).to eq 'ユーザが存在しません'
      end
    end

  end

end