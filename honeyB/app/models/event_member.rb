class EventMember < ActiveRecord::Base
	belongs_to :user
	belongs_to :event
	
	validates_uniqueness_of :user, :scope => :event
	validate :member_not_owner
	
	
	def member_not_owner
    		if user.id == event.creator
      			errors.add("Owner already a part of the event")
    		end
 
  		# ...
	end
end