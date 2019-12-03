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
end
