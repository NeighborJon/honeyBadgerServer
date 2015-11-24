class Event < ActiveRecord::Base
	belongs_to :user
	has_many :event_members
	has_many :members, :through => :event_members, source: :user
	
end
