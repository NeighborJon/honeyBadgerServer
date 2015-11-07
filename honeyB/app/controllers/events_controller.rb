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
  
  def mapEvents
  	
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

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:creator, :title, :longitude, :latitude, :start, :duration, :description, :category, :minReq, :private)
    end
end
