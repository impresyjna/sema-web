class Api::V1::RoomUsersController < ApplicationController
  respond_to :json
  before_action :authenticate_with_token!, only: [:index, :join_room, :destroy]

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

  def destroy
    room = Room.find(params[:room][:id])
    room_user = RoomUser.where("user_id=? and room_id=?", current_user.id, room.id).last
    game_cards1 = GameCard.where("ready=false and sent_who=?", room_user.id)
    game_cards2 = GameCard.where("room_user_id=?", room_user.id)
    cards_to_destroy = game_cards1 + game_cards2
    if(!game_cards1.blank?)
      game_cards1.destroy_all
    end
    if(!game_cards2.blank?)
      game_cards2.destroy_all
    end
    game_cards = GameCard.where("ready=true and sent_who=?", room_user.id)
    game_cards.each do |card|
      card.sent_who = nil;
    end
    room_user.destroy
    head 204
  end

end
