class UsersController < ApplicationController

	skip_before_filter :authenticate_user_from_token, only: [:create]
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    render json: @user
  end
  
  def uSearch
  	userList = Array.new
  	User.all.each do |user|
	  	if params[:fsearch] != nil && params[:lsearch] == nil
	  		if user.fName.start_with?(params[:fsearch])
	  			userList << user
	  		end
	  	elsif params[:lsearch] != nil && params[:fsearch] == nil
	  		if user.lName.start_with?(params[:lsearch])
	  			userList << user
	  		end
	  	elsif params[:lsearch] != nil && params[:fsearch] != nil
	  		if user.fName.start_with?(params[:fsearch]) && user.lName.start_with?(params[:lsearch])
	  			userList << user
	  		end
	  	end
	end
	userList = userList.uniq
	render json: userList
  end
  

  def checkin
  	@users = User.find(params[:user][:member_id])
  	experience = 1.0
  		event = Event.find_by(params[:user][:event_id])
  		if event.creator != @users.id
  			if (event.members.find_by(params[:user][:member_id])).present?
  			
	  			if params[:user][:cat].to_s == 'Shenanigan'
	  				@users.shenaniganExp += experience
	  				@users.update_attributes(:shenaniganExp => experience)
	  			elsif params[:user][:cat] == 'Philanthropy'
	  				@users.philanthropyExp += experience
	  				@users.update_attributes(:philanthropyExp => experience)
	  			elsif params[:user][:cat] == 'Fitness'
	  				@users.fitnessExp += experience
	  				@users.update_attributes(:fitnessExp => experience)
	  			elsif params[:user][:cat] == 'Education'
	  				@users.educationExp += experience
	  				@users.update_attributes(:educationExp => experience)
	  			end
	  		end
  		end
  end

  # POST /users
  # POST /users.json
  def create
	begin
    	@user = User.new(user_params)
    	@account = @user.build_account(email: @user.email, password: params[:user][:password])
    	
    	if @user.save
    		if @account.save
      			render json: @user, status: :created, location: @user
    		else
    			@user.destroy
     			render json: @user.errors, status: :unprocessable_entity
    		end
    	else
			render json: @account.errors, status: :unprocessable_entity    	
    	end
    rescue => error
    	render :json => error.message, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      	if @user.account.update(account_params)
      		head :no_content
      	end
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    begin
    	@user.destroy

    	head :no_content
    rescue => error
    	render :json => error.message
    end
  end

  private

    def set_user
      begin
      	@user = User.find(params[:id])
      rescue => error
      	render :json => error.message, status: :not_found
      end
    end

    def user_params
      params.require(:user).permit(:fName, :lName, :email, :category, :avatar_path, :auth_token, :description, :shenaniganExp, :fitnessExp, :educationExp, :philanthropyExp)
    end
    
    def user_check_params
      params.require(:user).permit(:email)
    end
    
    def account_params
    	params.require(:user).permit(:email, :password)
    end
end
