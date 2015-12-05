class BlockedUsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  
  # GET /blocked/
  def index
  	render nothing: true, status: 501
  end
  

  # GET /blocked/1
  # GET /blocked/1.json
  def show
    render json: @user.blocked
  end

  # DELETE /blocked/1
  # DELETE /blocked/1.json
  def destroy
    begin
    	@block = User.find(params[:blocked][:blocked_id])
	
		@user.blocked.delete(@block)
		render json: @user, status: :accepted, location: @user
	rescue => error
		render :json => error.message, status: :unprocessable_entity
	end
  end
  
  # OPTIONS  Not implemented
  def options
  	render nothing: true, status: 501;
  end
  
  # PATCH  Not implemented
  def update
  	render nothing: true, status: 501;
  end
  
  # POST /blocked/
  def create
  	begin
  		@user = User.find(params[:blocked][:user_id])
  		@block = User.find(params[:blocked][:blocked_id])
  		
		@user.blocked << @block
  	rescue => error
  		render :json => error.message, status: :unprocessable_entity
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
end
