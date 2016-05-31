class AddCategoryToCard < ActiveRecord::Migration
  def change
    add_reference :cards, :category, index: true, foreign_key: true
  end
end
