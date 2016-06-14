class GameCard < ActiveRecord::Base
  belongs_to :room_user
  belongs_to :card
end
