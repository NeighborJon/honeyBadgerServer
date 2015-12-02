class UserSerializer < ActiveModel::Serializer
  attributes :id, :fName, :lName, :description, :category, :shenaniganExp, :philanthropyExp, :educationExp, :fitnessExp

  has_many :messages
  has_many :events
  has_many :attending
  has_many :friends, serializer: FriendSerializer
  has_many :blocked, serializer: BlockedUserSerializer
  has_many :friend_invites
  has_many :event_invites
end
