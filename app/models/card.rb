class Card < ActiveRecord::Base
  has_many :question_in_cards
end
