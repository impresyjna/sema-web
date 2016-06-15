class GameCardSerializer < ActiveModel::Serializer
  attributes :id, :sender_login, :question_number, :card

  def sender_login
    if (!object.sent_who.blank?)
      RoomUser.find(object.sent_who).user.login
    end
  end

  def card
    CardSerializer.new(object.card, scope: scope, root: false, event: object)
  end
end
