class Event < ActiveRecord::Base
	belongs_to :user
	has_many :event_members
	has_many :members, :through => :event_members, source: :user
	
	#validate :user_quota, :on => :create
	
	#private
	#	def user_quota
	#		if user.events(:reload).today.count >= 2
	#			errors.add(:base, "Exceeds daily limit")
	#		end
	#	end
	
end
