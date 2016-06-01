class Card < ActiveRecord::Base
  has_many :question_in_cards

  accepts_nested_attributes_for :question_in_cards, :allow_destroy => true
end
