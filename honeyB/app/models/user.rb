class User < ActiveRecord::Base
	#has_secure_password
	has_many :messages, dependent: :destroy
	has_many :events, foreign_key: "creator", dependent: :destroy do
		# search through user's events to find the events created today
		def created_today
			where(:created_at => (Time.zone.now.beginning_of_day..Time.zone.now))
		end
		
		# search through user's events to find the events created on date provided
		def created_on(date)
			day = date.to_datetime
			where(:start => (day.beginning_of_day..day.end_of_day))
		end
	end
	
	has_one :account, dependent: :destroy
	
	has_many :event_members
	has_many :attending, :through => :event_members, source: :event
	
	has_many :friendships
	has_many :friends, :through => :friendships
	has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
	has_many :inverse_friends, :through => :inverse_friendships, :source => :user
	
	has_many :blocked_users
	has_many :blocked, :through => :blocked_users
	has_many :inverse_blocked_users, :class_name => "BlockedUser", :foreign_key => :blocked
	has_many :inverse_blocked, :through => :inverse_blocked_users, :source => :user
	
	has_many :friend_invites, :foreign_key => "receiver_id"
	has_many :inverse_friend_invites, :class_name => "FriendInvite", :foreign_key => "sender_id"
	
	has_many :event_invites, :foreign_key => "receiver_id"
	has_many :inverse_event_invites, :class_name => "EventInvite", :foreign_key => "event_id"
	
	validate :valid_category, on: :update
	
	def valid_category
		if category.present?
			if !Category.exists?(name: category)
				errors.add(:category, "invalid category")
			end
		end
	end
end
