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
end
