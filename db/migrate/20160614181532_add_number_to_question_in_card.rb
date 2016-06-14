class AddNumberToQuestionInCard < ActiveRecord::Migration
  def change
    add_column :question_in_cards, :number, :integer
  end
end
