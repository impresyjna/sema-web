class CreateGameCards < ActiveRecord::Migration
  def change
    create_table :game_cards do |t|
      t.references :room_user, index: true, foreign_key: true
      t.references :card, index: true, foreign_key: true
      t.integer :sent_who
      t.integer :question_number

      t.timestamps null: false
    end
  end
end
