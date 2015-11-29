class EventInviteSerializer < ActiveModel::Serializer
  attributes :id, :event_id, :receiver_id, :token, :accepted
  
end