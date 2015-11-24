class UsersController < ApplicationController
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

  # POST /users
  # POST /users.json
  def create
    if User.exists?(params[:user][:id])
    	render :json => '{error : {"code" : 100, "message" : "email invalid or already taken"}}'
    else
    	@user = User.new(user_params)
    	@account = @user.build_account(email: @user.email, password: :password)
    	
    	if @account.save
    		if @user.save
      			render json: @user, status: :created, location: @user
    		else
    			@account.destroy
     			render json: @user.errors, status: :unprocessable_entity
    		end
    	else
			render json: @account.errors, status: :unprocessable_entity    	
    	end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      if@user.account.update(account_params)
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
      params.require(:user).permit(:fName, :lName, :email, :auth_token, :description, :shenaniganExp, :fitnessExp, :educationExp, :philanthropyExp)
    end
    
    def user_check_params
      params.require(:user).permit(:email)
    end
    
    def account_params
    	params.require(:user).permit(:email, :password)
    end
end
