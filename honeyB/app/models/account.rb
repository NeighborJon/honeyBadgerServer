class Account < ActiveRecord::Base
	belongs_to :users
	before_create -> { self.auth_token = SecureRandom.hex }
end
