describe UsersController, type: :request do
  describe 'POST #recommend' do
    before do
      30.times do
        create(:user)
      end
    end

    it '体型のみの場合、体型で検索をして20件取得' do
    end

    it '本気度のみの場合、本気度で検索して20件取得' do

    end

    it '本気度、体型が存在　20件取得' do

    end

    it '体型、本気度が送られてこなくてもランダムで20件取得' do
    
    end
  end
end