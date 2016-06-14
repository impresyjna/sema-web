class Api::V1::RoomUsersController < ApplicationController
  respond_to :json
  before_action :authenticate_with_token!, only: [:index]

  def index
    user = current_user
    room = Room.find(params[:room][:id])
    users = room.room_users
    RoomUser.where("user_id=? and room_id=?", current_user.id, room.id).destroy_all
    room_user = room.room_users.create(user_id: current_user.id)
    room_user.save
    render json: users.where("user_id != ?", current_user.id), status: 200
  end
end
