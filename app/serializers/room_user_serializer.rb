class RoomUserSerializer < ActiveModel::Serializer
  attributes :id, :user_login

  def user_login
    object.user.login
  end
end
