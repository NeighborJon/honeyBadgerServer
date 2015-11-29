class FriendInviteSerializer < ActiveModel::Serializer
  attributes :id, :token, :accepted
  has_one :sender, serializer: UserShortSerializer
  
end