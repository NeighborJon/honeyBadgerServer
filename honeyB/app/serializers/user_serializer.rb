class UserSerializer < ActiveModel::Serializer
  attributes :id, :fName, :lName
  has_many :messages
  has_many :events
  has_many :friends, serializer: FriendSerializer
  has_many :friend_invites
end
