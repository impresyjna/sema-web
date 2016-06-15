class QuestionInCardSerializer < ActiveModel::Serializer
  attributes :number, :question_content

  def question_content
    object.question.content
  end
end
