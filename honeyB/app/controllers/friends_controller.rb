class FriendsController < ApplicationController
  before_action only: [:show, :update, :destroy]

  # GET /friends/1
  # GET /friends/1.json
  def show
  	@user = User.find(params[:id])
  
    render json: @user.friends
  end
  
  # POST /friends/1
  # POST /friends/1.json
  def create
    begin
    	@user = User.find(params[:id])
    	@friend = User.find(params[:friend][:friend_id])
	
		@user.friends << @friend
		@friend.friends << @user
		render json: @user, status: :added, location: @user
	rescue => error
		#render :json => '{error : {"code" : 200, "message" : "must provide xVal/yVal"}}'
		render :json => error.message
	end
  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    @friend = friend.find(params[:id])

    if @friend.update(friend_params)
      head :no_content
    else
      render json: @friend.errors, status: :unprocessable_entity
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    begin
    	@user = User.find(params[:id])
    	@friend = User.find(params[:friend][:friend_id])
	
		@user.friends.delete(@friend)
		@friend.friends.delete(@user)
		render json: @user, status: :accepted, location: @user
	rescue => error
		#render :json => '{error : {"code" : 200, "message" : "must provide xVal/yVal"}}'
		render :json => error.message
	end
  end
  
  # OPTIONS  Not implemented
  def options
  	render nothing: true, status: 501;
  end
  
  private
    def friend_params
      params.require(:friend).permit(:friend_id)
    end
end
