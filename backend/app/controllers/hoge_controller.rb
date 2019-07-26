class HogeController < ApplicationController
  def show
    render json: { message: 'huga' }
  end
end
