class Api::V1::GameCardsController < ApplicationController
  respond_to :json
  before_action :authenticate_with_token!, only: [:index]

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

  end

end
