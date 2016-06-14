class CreateRoomUsers < ActiveRecord::Migration
  def change
    create_table :room_users do |t|
      t.references :room, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
