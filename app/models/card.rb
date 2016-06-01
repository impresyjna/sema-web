class Card < ActiveRecord::Base
  has_many :question_in_cards, dependent: :destroy

  accepts_nested_attributes_for :question_in_cards, :allow_destroy => true
end
