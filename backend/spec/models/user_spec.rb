require 'rails_helper'

RSpec.describe User, type: :model do
  describe "DirectMessageGroup association" do
    context "has many by_users" do
      it { should have_many(:by_users).class_name('DirectMessageGroup').dependent(:destroy) }
    end

    context "has many to_users" do
      it { should have_many(:to_users).class_name('DirectMessageGroup').dependent(:destroy) }
    end

    context "when creating DM Group with not exist by_user_id and to_user_id" do
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
    end
  end

  describe "DirectMessage association" do
    context "has many send_users" do
      it { should have_many(:send_users).class_name('DirectMessage').dependent(:destroy) }       
    end

    context "when creating a direct message with a not exist direct_message_group_id" do
      before do
        create_list(:user,2)
        @first_user = User.first
        @secound_user = User.last

        @first_user.by_users.create!(to_user_id:@secound_user.id)
        @not_exist_dm_group_id = DirectMessageGroup.last.id + 1
      end

      it "raise error ActiveRecord::RecordInvalid" do        
        expect{ @secound_user.send_users.create!(body:"hogeee",direct_message_group_id:@not_exist_dm_group_id) }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
  
  describe "Friend association" do
    context "has many fridends" do
      it { should have_many(:friends) }
    end

    context "has many followings" do
      it { should have_many(:followings).through(:friends).source(:target).dependent(:destroy) }
    end
  end

  describe "GroupUser association" do
    context "has many group users" do
      it { should have_many(:group_users).dependent(:destroy) }
    end
  end

  describe "Group association" do
    context "has many groups" do
      it { should have_many(:groups).through(:group_users).dependent(:destroy) }
    end
  end

  describe "GroupMessage association" do
    context "has many group_messages" do
      it { should have_many(:group_messages).dependent(:destroy) }
    end
  end
end
