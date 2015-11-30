class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, :class_name => "User"
	
	validates_uniqueness_of :user, :scope => :friend
	validate :friend_not_self
	
	def friend_not_self
    	if user.id == friend.id
      		errors.add("Can't friend yourself")
    	end
	end
end