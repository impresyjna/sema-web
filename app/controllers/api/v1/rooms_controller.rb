class Api::V1::RoomsController < ApplicationController
  respond_to :json
  before_action :authenticate_with_token!, only: [:index]

  def index
    rooms = Room.all
    render json: rooms, status: 200
  end

  def create
    room = Room.create(room_params);
    room.category_id = Category.all.sample.id
    if room.save
      render json: room, status: 201
    else
      render json: { errors: room.errors }, status: 422
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end

end
