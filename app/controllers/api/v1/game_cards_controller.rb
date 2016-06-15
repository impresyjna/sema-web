class Api::V1::GameCardsController < ApplicationController
  respond_to :json
  before_action :authenticate_with_token!, only: [:index, :update, :unreceived_cards]

  def index
    room = Room.find(params[:room][:id])
    room_user = RoomUser.where("user_id=? and room_id=?", current_user.id, room.id).last
    cards = GameCard.where("ready=true and room_user_id=?", room_user.id)
    if(cards.blank?)
      5.times do
        card = Card.where(category_id: room.category_id).sample
        game_card = room_user.game_cards.create(card_id: card.id)
        game_card.save
      end
    end
    cards = GameCard.where("ready=true and room_user_id=?", room_user.id)
    render json: cards, status: 200
  end

  def unreceived_cards
    room = Room.find(params[:room][:id])
    room_user = RoomUser.where("user_id=? and room_id=?", current_user.id, room.id).last
    cards = GameCard.where("ready=false and room_user_id=?", room_user.id)
    render json: cards, status: 200
  end

  def update
    game_card = GameCard.find(params[:id])
    room = Room.find(params[:game_card][:room_id])
    room_user = RoomUser.where("user_id=? and room_id=?", current_user.id, room.id).last
    game_card.sent_who = room_user.id
    if game_card.update_attributes(game_card_params)
      render json: game_card, status: 200
    else
      render json: {errors: game_card.errors}, status: 422
    end

  end

  private

  def game_card_params
    params.require(:game_card).permit(:room_user_id, :question_number, :ready, :card_id)
  end

end
