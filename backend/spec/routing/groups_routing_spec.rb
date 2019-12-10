require "rails_helper"

RSpec.describe Api::GroupsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/api/groups").to route_to("api/groups#index", format: :json)
    end

    it "routes to #show" do
      expect(:get => "/api/groups/1").to route_to("api/groups#show", id: "1", format: :json)
    end

    it "routes to #join" do
      expect(:post => "/api/groups/1/join").to route_to("api/groups#join", id: "1", format: :json)
    end
  end
end

