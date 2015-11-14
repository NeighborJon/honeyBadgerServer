class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :creator, :category, :description, :start, :private
  has_many :members
end
