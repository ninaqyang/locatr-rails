class Api::EventsController < ApplicationController
  respond_to :json

  resource_description do
    formats ['json']
    resource_id 'Events'
    short 'Returns Event information'
  end

  api :GET, '/events', 'Gets a list of events'
  def index
    @events = Event.all
    respond_with @events
  end

  api :GET, '/events/:id', 'Gets an event'
  param :id, :number, 'Id (primary key of event)', required: true
  def show
    @event = Event.find(params[:id])
    respond_with @event
  end

  api :DELETE, '/events/:id', 'Deletes an event'
  param :id, :number, 'Id (primary key of event)', required: true
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    respond_with @event
  end

  api :POST, '/events', 'Creates an event'
  param :event, Hash, desc: 'Event info', required: true do
    param :title, String, desc: 'Title of event'
    param :address1, String, desc: 'Street Address 1'
    param :address2, String, desc: 'Street Address 2'
    param :city, String, desc: 'City'
    param :state, String, desc: 'State'
    param :latitude, Float, desc: 'Latitude'
    param :longitude, Float, desc: 'Longitude'
    param :starts_on, DateTime, desc: 'Event start on datetime'
    param :ends_on, DateTime, desc: 'Event ends on datetime'
  end
  def create
    @event = Event.new(event_params)

    if @event.save
      respond_with @event
    else
      render status: 422, json: @controller.to_json
    end
  end

  api :POST, '/events', 'Updates an event'
  param :id, :number, 'Id (primary key of event)', required: true
  param :event, Hash, desc: 'Event info', required: true do
    param :title, String, desc: 'Title of event'
    param :address1, String, desc: 'Street Address 1'
    param :address2, String, desc: 'Street Address 2'
    param :city, String, desc: 'City'
    param :state, String, desc: 'State'
    param :latitude, Float, desc: 'Latitude'
    param :longitude, Float, desc: 'Longitude'
    param :starts_on, DateTime, desc: 'Event start on datetime'
    param :ends_on, DateTime, desc: 'Event ends on datetime'
  end
  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      respond_with @event
    else
      render status: 422, json: @controller.to_json
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :address1, :address2, :city, :state,
      :zip, :state, :latitude, :longitude, :starts_on, :ends_on)
  end
end
