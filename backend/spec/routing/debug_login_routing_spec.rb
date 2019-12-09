require "rails_helper"

RSpec.describe Api::DebugController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/api/debug_login").to route_to("api/debug#index", format: :json)
    end
  end
end
