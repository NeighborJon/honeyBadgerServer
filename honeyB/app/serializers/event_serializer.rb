class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :creator, :start, :description, :longitude, :latitude, :private
end
