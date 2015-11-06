class User < ActiveRecord::Base
	has_many :messages, dependent: :destroy
	has_and_belongs_to_many :events
	has_one :account
	
end
