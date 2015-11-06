class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :creator, :start, :description
end
