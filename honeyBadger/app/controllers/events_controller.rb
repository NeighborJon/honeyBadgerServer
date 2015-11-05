class EventsController < ApplicationController

	def index
		# sends all users to view in JSON
		# format is defined in models/user.rb
		@events = Event.all
		respond_to do |format|
      		format.html { render json: @events}
      		format.xml  { render xml: @events}
      		format.json { render json: @events}
      	end
	end
	
	def show
		# sends specified user to view in JSON format
		# format is defined in models/user.rb
		@event = Event.find(params[:id])
		respond_to do |format|
      		format.html { render json: @event}
      		format.xml  { render xml: @event}
      		format.json { render json: @event}
      	end
	end
	
	def new
	end
	
	def edit
	end
	
	def create
		User.exists?(:user_id)
  			@event = Event.create(event_params)
	
  			if @event.save
  				redirect_to @event
  			else
  				puts "failed to create event"
  			end
  		
	end
 
	private
  		def event_params
    		params.require(:event).permit(:title, :user_id, :description, :startTime, :longitude, :latitude)
  	end
  	
  		def event_user_param
  			params.require(:event).permit(:user_id)
  	end
  	
  		def auth_params
  			params.require(:user).permit(:password)
  	end
end
