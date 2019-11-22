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
        @exist_user = User.first
        @not_exist_user_id = User.last.id + 1
      end

      it "raise error ActiveRecord::RecordInvalid" do
        expect{ @exist_user.by_users.create!(to_user_id:@not_exist_user_id) }.to raise_error(ActiveRecord::RecordInvalid)
        expect{ @exist_user.to_users.create!(by_user_id:@not_exist_user_id) }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context "when exist by_user_id and to_user_id into User table" do
      before do
        create_list(:user,3)
        @first_user = User.first
        @secound_user = User.find(@first_user.id + 1)
        @third_user = User.find(@secound_user.id + 1)
      end

      it "can create DM group " do
        expect{ @first_user.by_users.create!(to_user_id:@secound_user.id) }.to_not raise_error
        expect{ @first_user.by_users.create!(to_user_id:@third_user.id) }.to_not raise_error
        expect{ @secound_user.by_users.create!(to_user_id:@third_user.id) }.to_not raise_error
        
        expect( DirectMessageGroup.where(by_user_id:@first_user.id,to_user_id:@secound_user.id) ).to exist
        expect( DirectMessageGroup.where(by_user_id:@first_user.id,to_user_id:@third_user.id) ).to exist
        expect( DirectMessageGroup.where(by_user_id:@secound_user.id,to_user_id:@third_user.id) ).to exist
      end

      it "confirm DM Group what a specific user has" do
        @first_user.by_users.create!(to_user_id:@secound_user.id)
        @first_user.by_users.create!(to_user_id:@third_user.id)
        @secound_user.by_users.create!(to_user_id:@third_user.id)

        dm_group_of_first_user = DirectMessageGroup.where(by_user_id:@first_user.id).or(DirectMessageGroup.where(to_user_id:@first_user.id))
        dm_group_of_secound_user = DirectMessageGroup.where(by_user_id:@secound_user.id).or(DirectMessageGroup.where(to_user_id:@secound_user.id))
        dm_group_of_third_user = DirectMessageGroup.where(by_user_id:@third_user.id).or(DirectMessageGroup.where(to_user_id:@third_user.id))
        expect( dm_group_of_first_user.count ).to eq 2
        expect( dm_group_of_secound_user.count ).to eq 2
        expect( dm_group_of_third_user.count ).to eq 2
      end
    end
  end

  describe "DirectMessage association" do
    context "has many direct_messages" do
      it { should have_many(:direct_messages).dependent(:destroy) }
    end

    context do
      before do
        create_list(:user,2)
        @first_user = User.first
        @secound_user = User.last

        @first_user.by_users.create!(to_user_id:@secound_user.id)
        @first_dm_group = DirectMessageGroup.first

        @first_user.send_users.create!(body:"huga",direct_message_group_id:@first_dm_group.id)
        @secound_user.send_users.create!(body:"hoge",direct_message_group_id:@first_dm_group.id)
      end

      context "when exist direct_message_goup_id and send_user_id into DirectMessageGroup and User table" do  
        it "confirm direct messages" do
          dm_list = DirectMessageGroup.first.direct_messages
          dm_count = DirectMessage.where(direct_message_group_id:@first_dm_group.id).count
          expect( dm_list.count ).to eq dm_count
        end  
      end

      context "when not exest direct_message_group_id or send_user_id into DirectMessageGroup and User tabel" do
        it "raise error ActiveRecord::RecordInvalid" do
          @not_exist_dm_group_id = DirectMessageGroup.last.id + 1
          @not_exist_user_id = @secound_user.id + 1
          
          expect{ @first_dm_group.direct_messages.create!(body:"hugaaaaa",send_user_id:@not_exist_user_id) }.to raise_error(ActiveRecord::RecordInvalid)
          expect{ @secound_user.send_users.create!(body:"hogeee",direct_message_group_id:@not_exist_dm_group_id) }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end

    end
  end

end
