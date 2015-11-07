class Account < ActiveRecord::Base
	belongs_to :user
	before_create -> { self.auth_token = SecureRandom.hex }
end
