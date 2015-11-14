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
		eventD = (event.start).strftime("%Y-%B-%d")
		
			if params[:eventTitle] != nil
				if event.title == params[:eventTile]
					eventList << event
				end
				if params[:eventCat] != nil
					if event.title == params[:eventTitle] && event.category == params[:eventCat]
						eventList << event
					end
				
					if params[:eventDate] != nil
						if event.title == params[:eventTile] && event.category == params[:eventCat] && eventD == params[:eventDate]
							eventList << event
						end
					
						if params[:longMin] != nil && params[:longMax] != nil && params[:latMin] != nil && params[:latMax] != nil
							if event.latitude > ((params[:latMin]).to_f) && event.latitude < ((params[:latMax]).to_f) && event.longitude < ((params[:longMin]).to_f) && event.longitude > ((params[:longMax]).to_f)
								eventList << event
							end
						end
					end
				end
			else
				if event.category == params[:eventCat]
					eventList << event
				end
			end
		end
		render json: eventList
  end
  
  def mapEvents

  	mapList = Array.new 
  	Event.all.each do |event|
 			if event.latitude > ((params[:latMin]).to_f) && event.latitude < ((params[:latMax]).to_f)
 				if event.longitude < ((params[:longMin]).to_f) && event.longitude > ((params[:longMax]).to_f)
  						mapList << event
  				end
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
    	@event = @user.events.new(event_params)
	
		if @event.save
			render json: @event, status: :created, location: @event		
		end
	rescue => error
		#render :json => '{error : {"code" : 200, "message" : "must provide xVal/yVal"}}'
		render :json => error.message
	end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @event = Event.find(params[:id])

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
  
  def join
  	begin
  		@event = Event.find(params[:id])
  		@user = User.find(params[:event][:user_id])
  	
  		if @event.members << @user
  			render json: @event, location: @event
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
      params.require(:event).permit(:creator, :title, :longitude, :latitude, :start, :duration, :description, :category, :minReq, :private)
    end
end
