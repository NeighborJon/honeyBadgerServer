class FriendSerializer < ActiveModel::Serializer
  attributes :id, :fName, :lName, :avatar_path, :educationExp, :shenaniganExp, :fitnessExp, :philanthropyExp
end