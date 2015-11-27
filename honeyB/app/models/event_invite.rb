class EventInvite < ActiveRecord::Base
	belongs_to :event
	belongs_to :receiver, :class_name => "User"
	
	validates_uniqueness_of :event, :scope => :receiver
	validate :already_member
	validate :invite_not_creator
	
	def already_member
		event.members.each do |member|
			if member.id == receiver.id
				errors.add("Already a member")
			end
		end
	end
	
	def invite_not_creator
    	if event.creator == receiver.id
      		errors.add("Can't invite creator")
    	end
	end
end