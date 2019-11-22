require 'rails_helper'

RSpec.describe DirectMessageGroup, type: :model do
  describe "User association" do
    context "belong to by_user" do
      it { should belong_to(:by_user).class_name('User') }
    end
    
    context "belong to to_user" do
      it { should belong_to(:to_user).class_name('User') }
    end
  end

  describe "DirectMessage association" do
    context "has many direct_messages" do
      it { should have_many(:direct_messages).dependent(:destroy) }      
    end
  end
  
end
