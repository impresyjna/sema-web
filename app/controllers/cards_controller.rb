class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
    @card.question_in_cards.build
  end

  def edit
    @card = Card.find(params[:id])
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      flash[:success] = "Dodano kartę"
      redirect_to cards_path
    else
      flash[:warning] = "Nie udało się dodać karty"
      render 'new'
    end
  end

  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(card_params)
      flash[:success] = "Zapisano"
      redirect_to cards_path
    else
      render 'edit'
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url }
      format.json { head :no_content }
    end
  end

  private
    def card_params
      params.require(:card).permit(:category_id, question_in_cards_attributes: [:card_id, :question_id])
    end

end
