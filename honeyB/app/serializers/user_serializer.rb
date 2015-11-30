class UserSerializer < ActiveModel::Serializer
  attributes :id, :shenaniganExp
  has_many :messages
  has_many :events
  has_many :friends, serializer: FriendSerializer
end
