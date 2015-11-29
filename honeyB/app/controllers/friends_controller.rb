class FriendsController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /friends/1
  # GET /friends/1.json
  def show
  	@user = User.find(params[:id])
  
    render json: @user.friends
  end
  
  # POST /friends/1
  # POST /friends/1.json
  def reply
    begin
    	if (params[:friend][:accept]).present?
    		if (params[:friend][:token]).present?
    			@invite = FriendInvite.find(params[:friend][:invite_id])
    			
    			if (params[:friend][:token]) == @invite.token
    				@user = User.find(params[:id])
		   		 	@friend = User.find(params[:friend][:friend_id])
		   		 	
    				if params[:friend][:accept] == "true"
						@user.friends << @friend
						@friend.friends << @user
						
						@message = Message.create(user_ID: @user.id, recieverID: @friend.id, message: "friend invite accepted")
						@invite.destroy
					else
						@message = Message.create(user_ID: @user.id, recieverID: @friend.id, message: "friend invite declined")
						@invite.destroy
					end
					
					render json: @user, status: :accepted, location: @user
				else
					render :json => '{error : token invalid}', status: :unprocessable_entity
				end
			else
				render :json => '{error : token missing}', status: :unprocessable_entity
			end
		else
			render :json => '{error : accept missing}', status: :unprocessable_entity
		end
	rescue => error
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
  
  # POST /friends/
  def create
  	begin
  		@sender = User.find(params[:friend][:sender])
  		@receiver = User.find(params[:friend][:receiver])
  		@invite = FriendInvite.new(sender_id:@sender.id, receiver_id:@receiver.id)
  		
  		
  		if @invite.save
  			@receiver.friend_invites << @invite
  		else
  			render :json => @invite.errors, status: :unprocessable_entity
  		end
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
    
    def friend_params
      params.require(:friend).permit(:friend_id)
    end
    
    def invite_params
      params.require(:friend).permit(:sender, :receiver)
    end
end
