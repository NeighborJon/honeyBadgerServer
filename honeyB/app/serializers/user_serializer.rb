class UserSerializer < ActiveModel::Serializer
  attributes :id, :shenaniganExp, :philanthropyExp, :educationExp, :fitnessExp
  has_many :messages
  has_many :events
  has_many :friends, serializer: FriendSerializer
end
