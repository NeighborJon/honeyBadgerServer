class UsersController < ApplicationController



	def index
		# sends all users to view in JSON
		# format is defined in models/user.rb
		@users = User.all + UserAccount.all
		respond_to do |format|
      		format.html { render json: @users}
      		format.xml  { render xml: @users}
      		format.json { render json: @users}
      	end
	end
	
	def show
		# sends specified user to view in JSON format
		# format is defined in models/user.rb
		@user = User.find(params[:id])
		respond_to do |format|
      		format.html { render json: @user}
      		format.xml  { render xml: @user}
      		format.json { render json: @user}
      	end
	end
	
	def new
	end
	
	def edit
	end
	
	def create
  		@user = User.create(user_params)
   		@account = UserAccount.create(user_id:@user.id, password: auth_params[:password])

  		
  		if @account.save
  			if @user.save
  				redirect_to @user
  			else
  				puts "failed to create user"
  			end
  		else
  			puts "failed to create account"
  		end
	end
 
	private
  		def user_params
    		params.require(:user).permit(:name, :email)
  	end
  	
  		def auth_params
  			params.require(:user).permit(:password)
  	end
end
