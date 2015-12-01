class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    render json: @events
  end

  # GET /events/1
  # GET /events/1.json
  def show
    render json: @event
  end
  
  def search
	eventList = Array.new
	Event.all.each do |event|
		eventD = (event.start).strftime("%Y-%m-%d")
		
		#searching through 2 filters
			if params[:eventTitle] != nil && params[:eventCat] != nil
				if event.title == params[:eventTitle] && event.category == params[:eventCat]
					eventList << event
				end
			elsif params[:eventTitle] != nil && params[:eventDate] != nil
				if event.title == params[:eventTitle] && eventD == params[:eventDate]
					eventList << event
				end
			elsif params[:eventTitle] != nil && params[:latMin] != nil && params[:latMax] != nil && params[:longMin] != nil && params[:longMax] != nil
				if event.title == params[:eventTitle] && event.latitude > ((params[:latMin]).to_f) && event.latitude < ((params[:latMax]).to_f) && event.longitude > ((params[:longMin]).to_f) && event.longitude < ((params[:longMax]).to_f)
					eventList << event
				end
			elsif params[:eventCat] != nil && params[:eventDate] != nil
				if event.category == params[:eventCat] && eventD == params[:eventDate]
					eventList << event
				end
			elsif params[:eventCat] != nil && params[:latMin] != nil && params[:latMax] != nil && params[:longMin] != nil && params[:longMax] != nil
				if event.category == params[:eventCat] && event.latitude > ((params[:latMin]).to_f) && event.latitude < ((params[:latMax]).to_f) && event.longitude > ((params[:longMin]).to_f) && event.longitude < ((params[:longMax]).to_f)
					eventList << event
				end
			elsif params[:eventDate] != nil && params[:latMin] != nil && params[:latMax] != nil && params[:longMin] != nil && params[:longMax] != nil
				if eventD == params[:eventDate] && params[:eventCat] && event.latitude > ((params[:latMin]).to_f) && event.latitude < ((params[:latMax]).to_f) && event.longitude > ((params[:longMin]).to_f) && event.longitude < ((params[:longMax]).to_f)
					eventList << event
				end
			end
			
		#searching through 3 filters
			if params[:eventTitle] != nil && params[:eventCat] != nil && params[:eventDate] != nil
				if event.title == params[:eventTitle] && event.category == params[:eventCat] && eventD == params[:eventDate]
					eventList << event
				end
			elsif params[:eventTitle] != nil && params[:eventCat] != nil && params[:latMax] != nil && params[:longMin] != nil && params[:longMax] != nil
				if event.title == params[:eventTitle] && event.category == params[:eventCat] && event.latitude > ((params[:latMin]).to_f) && event.latitude < ((params[:latMax]).to_f) && event.longitude > ((params[:longMin]).to_f) && event.longitude < ((params[:longMax]).to_f)
					eventList << event
				end
			elsif params[:eventTitle] != nil && params[:eventDate] != nil && params[:latMax] != nil && params[:longMin] != nil && params[:longMax] != nil
				if event.title == params[:eventTitle] && eventD == params[:eventDate] && event.latitude > ((params[:latMin]).to_f) && event.latitude < ((params[:latMax]).to_f) && event.longitude > ((params[:longMin]).to_f) && event.longitude < ((params[:longMax]).to_f)
					eventList << event
				end
			elsif params[:eventCat] != nil && params[:eventDate] != nil && params[:latMax] != nil && params[:longMin] != nil && params[:longMax] != nil
				if event.category == params[:eventCat] && eventD == params[:eventDate] && event.latitude > ((params[:latMin]).to_f) && event.latitude < ((params[:latMax]).to_f) && event.longitude > ((params[:longMin]).to_f) && event.longitude < ((params[:longMax]).to_f)
					eventList << event
				end
			end
			
		#searching through all filters
			if params[:eventTitle] != nil && params[:eventCat] != nil && params[:eventDate] != nil && params[:eventDate] != nil && params[:latMax] != nil && params[:longMin] != nil && params[:longMax] != nil
				if event.title == params[:eventTitle] && event.category == params[:eventCat] && eventD == params[:eventDate] && event.latitude > ((params[:latMin]).to_f) && event.latitude < ((params[:latMax]).to_f) && event.longitude > ((params[:longMin]).to_f) && event.longitude < ((params[:longMax]).to_f)
					eventList << event
				end
			end
			
		#searching through a single filter
			if params[:eventTitle] != nil
				if event.title == params[:eventTitle]
					eventList << event
				end
			elsif params[:eventCat] != nil
				if event.category == params[:eventCat]
					eventList << event
				end
			elsif params[:eventDate] != nil
				if eventD == params[:eventDate]
					eventList << event
				end
			elsif params[:latMin] != nil && params[:latMax] != nil && params[:longMin] != nil && params[:longMax] != nil
				if event.latitude > ((params[:latMin]).to_f) && event.latitude < ((params[:latMax]).to_f) && event.longitude > ((params[:longMin]).to_f) && event.longitude < ((params[:longMax]).to_f)
					eventList << event
				end
			end
				
			
	end
	eventList = eventList.uniq
	render json: eventList
  end
  
  def mapEvents

  	mapList = Array.new 
  	Event.all.each do |event|
  		if event.longitude > ((params[:longMin]).to_f) && event.longitude < ((params[:longMax]).to_f)
 				if event.latitude > ((params[:latMin]).to_f) && event.latitude < ((params[:latMax]).to_f)
  						mapList << event
  				end	
		end
  		
  	end
  	render json: mapList
  end

  # POST /events
  # POST /events.json
  def create
    begin
    	@user = User.find(params[:event][:creator])
    	
    	# verify number of events created today
    	if @user.events.created_today.count <= 10
    		# verify number of event created on the specified day
    		if @user.events.created_on(params[:event][:start]).count <= 4
    			@event = @user.events.new(event_params)
	
				if @event.save
					render json: @event, status: :created, location: @event		
				end
			else
				render :json => '{error : Reached event creation limit for day provided}', status: :unprocessable_entity
			end
		else
			render :json => '{error : Reached event daily limit}', status: :unprocessable_entity
		end
		
		
	rescue => error
		#render :json => '{error : {"code" : 200, "message" : "must provide xVal/yVal"}}'
		render :json => error.message
	end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
	if @event.update(event_params)
      head :no_content
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy

    head :no_content
  end
  
  # Join events /events/1/join
  def join
  	begin
  		@event = Event.find(params[:id])
  		@user = User.find(params[:event][:user_id])
  		
  		if @event.private == true
  			if (params[:event][:accept]).present?
  				if (params[:event][:token]).present?
  					@invite = EventInvite.find(params[:event][:invite_id])
  					
  					if (params[:event][:token]) == @invite.token
  						if (params[:event][:accept]) == "false"
  							@message = Message.create(user_ID: @user.id, recieverID: @event.creator, message: "event invite declined")
							@invite.destroy
							return
  						end
  						
  						# All private invite checks pass.  continue as normal join event
  					else
  						render :json => '{error : token invalid}', status: :unprocessable_entity
  						return
  					end
  				else
  					render :json => '{error : token missing}', status: :unprocessable_entity
  					return
  				end
  			else
  				render :json => '{error : accept missing.  Private events require additional data}', status: :unprocessable_entity
  				return
  			end
  		end
  		
  	
  		if @event.members << @user
  			if @event.private
  				@message = Message.create(user_ID: @user.id, recieverID: @event.creator, message: "event invite declined")
  				@invite.destroy
  			end
  			
  			render json: @event, location: @event
  		end
  	rescue => error
  		render :json => error.message
  	end
  end
  
  def leave
	begin
  		@event = Event.find(params[:id])
  		@user = User.find(params[:event][:user_id])
  	
  		@event.members.delete(@user)
	rescue => error
		render :json => error.message
	end
  end
  
  # Invite events /events/1/invite
  def invite
  	begin
  		@event = Event.find(params[:id])
  		@receiver = User.find(params[:event][:receiver])
  		@invite = EventInvite.new(event_id:@event.id, receiver_id:@receiver.id)
  		
  		
  		if @invite.save
  			@receiver.event_invites << @invite
  		else
  			render :json => @invite.errors, status: :unprocessable_entity
  		end
  	rescue => error
  		render :json => error.message
  	end
  end

  private

   def set_event
      @event = Event.find(params[:id])
	end   

    def event_params
      params.require(:event).permit(:creator, :title, :longitude, :latitude, :start, :category, :duration, :description, :minReq, :maxReq, :private)
    end
end
