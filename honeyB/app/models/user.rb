class User < ActiveRecord::Base
	has_many :messages, dependent: :destroy
	has_many :events, foreign_key: "creator", dependent: :destroy do
		def created_today
			where(:created_at => (Time.zone.now.beginning_of_day..Time.zone.now))
		end
		
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
end
