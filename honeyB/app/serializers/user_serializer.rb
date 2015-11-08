class UserSerializer < ActiveModel::Serializer
  attributes :id
  
  has_many :messages
  has_many :events
end
