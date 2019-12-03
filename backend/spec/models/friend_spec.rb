require 'rails_helper'

RSpec.describe Friend, type: :model do
  describe "User association" do
    context "belongs to user" do
      it { should belong_to(:user) }
    end

    context "belongs to target" do
      it { should belong_to(:target).class_name('User') }
    end
  end
end
