require 'rails_helper'

RSpec.describe DirectMessage, type: :model do
  describe "User association" do
    context "belongs to send_user" do
      it { should belong_to(:send_user).class_name('User') } 
    end
  end
  
  describe "DirectMessageGroup" do
    context "belongs to direct_message_group" do
      it { should belong_to(:direct_message_group) } 
    end
  end
  
end
