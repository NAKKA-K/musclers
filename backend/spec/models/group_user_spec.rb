require 'rails_helper'

RSpec.describe GroupUser, type: :model do
  describe "User association" do
    context "belongs to user" do
      it { should belong_to(:user) }
    end
  end

  describe "Group association" do
    context "belongs to group" do
      it { should belong_to(:group) }
    end
  end

  it "is only join a group once" do
    group = create(:group)
    user = create(:user)
    GroupUser.create!(user: user, group: group)
    expect {
      GroupUser.create(user: user, group: group)
    }.to raise_error(ActiveRecord::RecordNotUnique)
  end
end
