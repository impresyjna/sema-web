class QuestionInCard < ActiveRecord::Base
  belongs_to :card
  belongs_to :question
end
