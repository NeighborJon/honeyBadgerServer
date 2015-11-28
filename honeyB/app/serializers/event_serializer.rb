class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :creator, :start, :duration, :description, :longitude, :latitude, :private
  has_many :members, serializer: EventMemberSerializer
end
