class CardSerializer < ActiveModel::Serializer
  attributes :question_in_cards

  def question_in_cards
    object.question_in_cards.map do |question|
      QuestionInCardSerializer.new(question, scope: scope, root: false, event: object)
    end
  end
end
