class FriendInvite < ActiveRecord::Base
	belongs_to :sender, :class_name => "User"
	belongs_to :receiver, :class_name => "User"
	
	validates_uniqueness_of :sender, :scope => :receiver
	validate :already_friend
	validate :friend_not_self
	validate :user_not_blocked
	
	def already_friend
		sender.friends.each do |friend|
			if friend.id == receiver.id
				errors.add("Already a friend")
			end
		end
	end
	
	def friend_not_self
    	if sender.id == receiver.id
      		errors.add("Can't friend yourself")
    	end
	end
	
	def user_not_blocked
		sender.blocked.each do |blocked|
			if blocked.id == receiver.id
				errors.add("Can't invite blocked user")
			end
		end
	end
end