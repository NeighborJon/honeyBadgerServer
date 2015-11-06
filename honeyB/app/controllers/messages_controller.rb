class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all

    render json: @messages
  end

  # GET /messages/1
  # GET /messages/1.json
  
  def recievedMessages
  #need to add to the end of the URL 'recievedMessages?recieverID=[ID to search for]'
  	message = Message.where(recieverID: params[:recieverID])
  	if message != nil
  		render json: message
  	else
  		render json: "No recieved messages"
  	end
  end
  
  def sentMessages
  #need to add to the URL 'sentMessages?user_ID=[ID to search for]'
  	message = Message.where(user_ID: params[:user_ID])
  	if message != nil
  		render json: message
  	else
  		render json: "No recieved messages"
  	end
  end
  
  def show
    render json: @message
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    if @message.save
      render json: @message, status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    if @message.update(message_params)
      head :no_content
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy

    head :no_content
  end

  private

    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:user_ID, :recieverID, :message)
    end
end
