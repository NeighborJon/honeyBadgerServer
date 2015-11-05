class User < ActiveRecord::Base
	has_many :messages
	has_and_belongs_to_many :events
	
	
end
