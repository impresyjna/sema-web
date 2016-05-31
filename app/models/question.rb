class Question < ActiveRecord::Base
  belongs_to :category
  has_many :question_in_cards
end
