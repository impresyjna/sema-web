class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :login, :auth_token
end
