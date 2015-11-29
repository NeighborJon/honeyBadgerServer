class EventMember < ActiveRecord::Base
	belongs_to :user
	belongs_to :event
	
	validates_uniqueness_of :user, :scope => :event
	validate :member_not_owner
	validate :member_not_blocked
	
	def member_not_owner
    	if user.id == event.creator
      		errors.add("Owner already a part of the event")
    	end
	end
	
	def member_not_blocked
		owner = User.find(event.creator)
		
		owner.blocked.each do |blocked|
			if blocked.id == user.id
				errors.add("Blocked user cannot join")
			end
		end
	end
end