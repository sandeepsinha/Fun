require 'pry'
class EventsController < ApplicationController
  def list
    @events = Event.all
  end

  def show
    @events = Event.all
  end

  def display_event
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to :events
    else
      render 'new'
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :description ,:time ,:venue)
  end
end
