class MessageSerializer < ActiveModel::Serializer
  attributes :user_ID, :recieverID, :message
end
