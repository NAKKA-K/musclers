require "rails_helper"

RSpec.describe Api::GroupsController, type: :routing do
  describe "routing" do
    it "routes to #requestFriend" do
      expect(:post => "/api/user/friends").to route_to("api/friends#requestFriend", format: :json)
    end
  end
end

