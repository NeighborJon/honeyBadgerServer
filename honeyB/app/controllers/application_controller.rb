class ApplicationController < ActionController::API

	include ActionController::HttpAuthentication::Basic::ControllerMethods
	include ActionController::HttpAuthentication::Token::ControllerMethods
	
	#config.force_ssl = true

	before_filter :authenticate_user_from_token, except: [:token]

	def token
		authenticate_with_http_basic do |email, password|
			account = Account.find_by(email: email)
			if account && account.password == password
				render json: { token: account.auth_token } 

			else
				render json: { error: 'Incorrect credentials' }, status: 401
			end
		end
	end
	
	
	
	private
	
	def authenticate_user_from_token
		unless authenticate_with_http_token { |token, options| Account.find_by(auth_token: token) }
			render json: { error: 'Bad Token' }, status: 401
		end
	end

end
