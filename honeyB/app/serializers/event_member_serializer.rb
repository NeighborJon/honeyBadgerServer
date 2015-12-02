class EventMemberSerializer < ActiveModel::Serializer
  attributes :id, :fName, :lName, :checkedin
end