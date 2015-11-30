class BlockedUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :blocked, :class_name => "User"
	
	validates_uniqueness_of :user, :scope => :blocked
	validate :blocked_not_self
	validate :not_friend
	
	def blocked_not_self
    	if user.id == blocked.id
      		errors.add("Can't block yourself")
    	end
	end
	
	def not_friend
		user.friends.each do |friend|
			if friend.id == blocked.id
				errors.add("Can't block a friend")
			end
		end
	end
end