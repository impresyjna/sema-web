class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    @categories = Category.all.pluck(:name, :id)
  end

  def edit
    @question = Question.find(params[:id])
    @categories = Category.all.pluck(:name, :id)
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "Dodano pytanie"
      redirect_to questions_path
    else
      flash[:warning] = "Nie udało się dodać pytania"
      render 'new'
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:success] = "Dane zaktualizowane"
      redirect_to questions_path
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.confirmed
      @question.confirmed = false
    else
      @question.confirmed = true
    end
    if @question.save
      flash[:success] = "Pomyślnie zmieniono"
      redirect_to questions_path
    else
      flash[:warning] = "Nie udało się zmienić"
      redirect_to questions_path
    end
  end

  private

  def question_params
    params.require(:question).permit(:content, :category_id, :confirmed)
  end

end
