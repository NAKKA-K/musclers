require 'rails_helper'

RSpec.describe Group, type: :model do
  describe "GroupUser association" do
    context "has many group_users" do
      it { should have_many(:group_users) }
    end
  end

  describe "User association" do
    context "has many users" do
      it { should have_many(:users).through(:group_users).dependent(:destroy) }
    end
  end

  describe "GroupMessage association" do
    context "has many group_messages" do
      it { should have_many(:group_messages).dependent(:destroy) }
    end
  end

  describe "group validations" do
    it "is invalid without a name" do
      group = Group.new(name: nil)
      group.valid?
      expect(group.errors[:name].present?).to be_truthy
    end

    it "is invalid without a description" do
      group = Group.new(description: nil)
      group.valid?
      expect(group.errors[:description].present?).to be_truthy
    end
    it "is invalid without a is_public" do
      group = Group.new(is_public: nil)
      group.valid?
      expect(group.errors[:is_public].present?).to be_truthy
    end

  end
end
