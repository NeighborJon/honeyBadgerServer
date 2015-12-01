class Event < ActiveRecord::Base
	belongs_to :user

	has_many :event_members
	has_many :members, :through => :event_members, source: :user
	
	validates :creator, :latitude, :longitude, presence: true
	validate :valid_category
	
	def valid_category
		if !Category.exists?(name: category)
			errors.add("invalid category")
		end
	end
end
