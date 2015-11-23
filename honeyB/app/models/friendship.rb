class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, :class_name => "User"
	
	validates_uniqueness_of :user, :scope => :friend
	validate :user_not_friend
	
	def user_not_friend
    	if user.id == friend.id
      		errors.add("Can't friend yourself")
    	end
	end
end