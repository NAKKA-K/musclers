require 'rails_helper'

RSpec.describe DirectMessageGroup, type: :model do
  describe "User association" do
    context "belong to by_user" do
      it { should belong_to(:by_user).class_name('User') }
    end
    
    context "belong to to_user" do
      it { should belong_to(:to_user).class_name('User') }
    end

    context "when not exest by_user_id or to_user_id into User table" do
      before do
        create(:user)
        @exist_user_id = User.first.id
        @not_exist_user_id = User.last.id + 1
      end

      it "raise error ActiveRecord::RecordInvalid" do
        expect{ DirectMessageGroup.create!(by_user_id:@exist_user_id,to_user_id:@not_exist_user_id) }.to raise_error(ActiveRecord::RecordInvalid)
        expect{ DirectMessageGroup.create!(by_user_id:@not_exist_user_id,to_user_id:@exist_user_id) }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context "when exist by_user_id and to_user_id into User table" do
      before do
        create_list(:user,3)
        @first_user_id = User.first.id
        @secound_user_id = User.find(@first_user_id + 1).id
        @third_user_id = User.find(@secound_user_id + 1).id
      end

      it "can create DM group " do
        expect{ DirectMessageGroup.create!(by_user_id:@first_user_id,to_user_id:@secound_user_id) }.to_not raise_error
        expect{ DirectMessageGroup.create!(by_user_id:@secound_user_id,to_user_id:@first_user_id) }.to_not raise_error
        expect{ DirectMessageGroup.create!(by_user_id:@third_user_id,to_user_id:@secound_user_id) }.to_not raise_error
        
        expect( DirectMessageGroup.where(by_user_id:@first_user_id,to_user_id:@secound_user_id) ).to exist
        expect( DirectMessageGroup.where(by_user_id:@secound_user_id,to_user_id:@first_user_id) ).to exist
        expect( DirectMessageGroup.where(by_user_id:@third_user_id,to_user_id:@secound_user_id) ).to exist
      end

      it "confirm DM Group what a specific user has" do
        DirectMessageGroup.create!(by_user_id:@first_user_id,to_user_id:@secound_user_id)
        DirectMessageGroup.create!(by_user_id:@first_user_id,to_user_id:@third_user_id)
        DirectMessageGroup.create!(by_user_id:@third_user_id,to_user_id:@secound_user_id)

        dm_group_of_first_user = DirectMessageGroup.where(by_user_id:@first_user_id).or(DirectMessageGroup.where(to_user_id:@first_user_id))
        dm_group_of_secound_user = DirectMessageGroup.where(by_user_id:@secound_user_id).or(DirectMessageGroup.where(to_user_id:@secound_user_id))
        dm_group_of_third_user = DirectMessageGroup.where(by_user_id:@third_user_id).or(DirectMessageGroup.where(to_user_id:@third_user_id))
        expect( dm_group_of_first_user.count ).to eq 2
        expect( dm_group_of_secound_user.count ).to eq 2
        expect( dm_group_of_third_user.count ).to eq 2
      end
    end
  end

  describe "DirectMessage association" do
    context "has many direct_messages" do
      before do
        create_list(:user,2)
        @first_user_id = User.first.id
        @secound_user_id = User.last.id

        DirectMessageGroup.create!(by_user_id:@first_user_id,to_user_id:@secound_user_id)
        @dm_group_id = DirectMessageGroup.first.id

        DirectMessage.create!(body:"huga",direct_message_group_id:@dm_group_id,send_user_id:@first_user_id)
        DirectMessage.create!(body:"hoge",direct_message_group_id:@dm_group_id,send_user_id:@secound_user_id)          
      end

      it { should have_many(:direct_messages).dependent(:destroy) }

      context "when exist direct_message_goup_id and send_user_id into DirectMessageGroup and User table" do  
        it "confirm direct messages" do
          dm_list = DirectMessageGroup.first.direct_messages
          expect( dm_list.count ).to eq 2
        end  
      end

      context "when not exest direct_message_group_id or send_user_id into DirectMessageGroup and User tabel" do
        it "raise error ActiveRecord::RecordInvalid" do
          @not_exist_dm_group_id = DirectMessageGroup.last.id + 1
          @not_exist_user_id = @secound_user_id + 1

          expect{ DirectMessage.create!(body:"huga",direct_message_group_id:@dm_group_id,send_user_id:@not_exist_user_id) }.to raise_error(ActiveRecord::RecordInvalid)
          expect{ DirectMessage.create!(body:"hoge",direct_message_group_id:@not_exist_dm_group_id,send_user_id:@secound_user_id) }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end  
    end
  end
  
end
