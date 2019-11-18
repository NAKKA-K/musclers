require 'rails_helper'

RSpec.describe User, type: :model do
  describe "DirectMessageGroup association" do
    context "has many by_users" do
      it { should have_many(:by_users).class_name('DirectMessageGroup').dependent(:destroy) }      
    end
    
    context "has many to_users" do
      it { should have_many(:to_users).class_name('DirectMessageGroup').dependent(:destroy) }
    end
  end

  describe "DirectMessage association" do
    context "has many send_users" do
      it { should have_many(:send_users).class_name('DirectMessage').dependent(:destroy) }       
    end
  end  
end
