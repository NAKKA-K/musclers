module Api
  class UsersController < ApplicationController
    def index
      render json: { message:"I'm index." }
    end

    def show
      render json: { message:"I'm show." }
    end

    def create
      render json: { message:"I'm create." }
    end

    def update
      render json: { message:"I'm update." }
    end

    def destroy
      render json: { message:"I'm destroy." }
    end
  end
end