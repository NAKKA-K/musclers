require "rails_helper"

RSpec.describe Api::GroupMembersController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(:get => "/api/groups/1/users").to route_to("api/group_members#show", group_id: "1", format: :json)
    end
  end
end

