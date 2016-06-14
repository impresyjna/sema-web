class Api::V1::RoomsController < ApplicationController
  respond_to :json

  def index
    rooms = Room.all
    render json: rooms, status: 200
  end

end
