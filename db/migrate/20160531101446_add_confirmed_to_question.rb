class AddConfirmedToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :confirmed, :boolean, default: false
  end
end
