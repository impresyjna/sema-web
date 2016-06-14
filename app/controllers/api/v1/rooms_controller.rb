class Api::V1::RoomsController < ApplicationController
  respond_to :json
  before_action :authenticate_with_token!, only: [:index]

  def index
    rooms = Room.all
    render json: rooms, status: 200
  end

end
