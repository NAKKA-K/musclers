require "rails_helper"

RSpec.describe Api::InformationController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/api/user/information").to route_to("api/information#index", format: :json)
    end
  end
end
