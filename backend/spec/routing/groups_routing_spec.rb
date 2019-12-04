require "rails_helper"

RSpec.describe Api::GroupsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/api/groups").to route_to("api/groups#index", format: :json)
    end
  end
end

