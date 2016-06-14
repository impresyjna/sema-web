class AddReadyToGameCard < ActiveRecord::Migration
  def change
    add_column :game_cards, :ready, :boolean, default: true
  end
end
