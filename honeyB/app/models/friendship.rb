class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, :class_name => "User"
	
	validates_uniqueness_of :user, :scope => :friend
	validate :friend_not_self
	validate :friend_not_blocked
	
	def friend_not_self
    	if user.id == friend.id
      		errors.add("Can't friend yourself")
    	end
	end
	
	def friend_not_blocked
		user.blocked.each do |blocked|
			if blocked.id == friend.id
				errors.add("Can't friend blocked user")
			end
		end
	end
end