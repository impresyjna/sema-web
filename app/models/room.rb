class Room < ActiveRecord::Base
  has_many :room_users
  belongs_to :category
end
