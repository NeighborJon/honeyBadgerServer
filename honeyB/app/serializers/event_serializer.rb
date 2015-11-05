class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :start, :description
end
