class User < ActiveRecord::Base
	has_many :messages, dependent: :destroy
	has_many :events, foreign_key: "creator", dependent: :destroy
	has_one :account, dependent: :destroy
	has_many :event_members
	has_many :attending, :through => :event_members, source: :event
	
end
