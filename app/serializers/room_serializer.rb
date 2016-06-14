class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :category_name, :users_count

  def category_name
    object.category.name
  end

  def users_count
    object.room_users.count
  end
end
