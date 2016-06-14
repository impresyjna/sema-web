class RoomUser < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  has_many :game_cards
end
