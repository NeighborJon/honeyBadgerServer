class FriendSerializer < ActiveModel::Serializer
  attributes :id, :fName, :lName, :avatar_path
end