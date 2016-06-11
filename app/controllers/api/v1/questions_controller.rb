class Api::V1::QuestionsController < ApplicationController
  def create
    question = Question.new(question_params)
    if question.save
      render json: question, status: 201
    else
      render json: { errors: question.errors }, status: 422
    end
  end

  private
  def question_params
    params.require(:question).permit(:content)
  end
end
