class BlockedUserSerializer < ActiveModel::Serializer
  attributes :id, :fName, :lName, :avatar_path
end
