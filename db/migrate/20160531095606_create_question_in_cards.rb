class CreateQuestionInCards < ActiveRecord::Migration
  def change
    create_table :question_in_cards do |t|
      t.references :card, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
