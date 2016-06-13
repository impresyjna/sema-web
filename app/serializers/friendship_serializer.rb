class FriendshipSerializer < ActiveModel::Serializer
  attributes :id, :friend

  def friend
      UserSerializer.new(User.find(object.friend_id), scope: scope, root: false, event: object)
  end
end
