class Account < ActiveRecord::Base
	belongs_to :user
	before_create -> { self.auth_token = SecureRandom.hex }
	
	validates :email, uniqueness: true, presence: true
	validates :password, presence: true, length: { minimum: 2 }
#	before_create :encrypt_password
	validate :encrypt_password, on: :update
	
	def encrypt_password
		self.password = BCrypt::Password.create(password)
	end
	
	def is_password?(password)
		BCrypt::Password.new(self.password) == password
	end
end
