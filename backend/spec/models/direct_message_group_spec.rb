require 'rails_helper'

RSpec.describe DirectMessageGroup, type: :model do
  describe "connect user table" do
    it "is valid with user_id" do
      @user1 = create(:user)
      @user2 = create(:user)
      direct_message_group = create(:direct_message_group,by_user_id:user1.id,to_user_id:user2.id)
    end
  end
end
