class QuestionInCardSerializer < ActiveModel::Serializer
  attributes :number, :question

  def question
    object.question.content
  end
end
