require "rails_helper"

RSpec.describe Api::GroupMembersController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(:get => "/api/group_members/1").to route_to("api/group_members#show", id: "1", format: :json)
    end
  end
end

