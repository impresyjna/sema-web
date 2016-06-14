class Api::V1::RoomUsersController < ApplicationController
  respond_to :json
  before_action :authenticate_with_token!, only: [:index]

  def index
    room = Room.find(params[:room][:id])
    users = room.room_users
    render json: users, status: 200
  end

  def join_room
    if (RoomUser.where("user_id=? and room_id=?", current_user.id, params[:room][:id]).blank?)
      room_user = current_user.room_users.create(room_id: params[:room][:id])
    else
      room_user = RoomUser.where("user_id=? and room_id=?", current_user.id, params[:room][:id]).last
    end
    render json: room_user, status: 200
  end
end
