require 'pry'
class EventsController < ApplicationController

  def show
  end

  def new
    @event = Event.new
  end

  def create
    # binding.pry
    @event = Event.new(event_params)
    if @event.save
      redirect_to new_events_path
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :description, :date ,:time ,:venue)
  end
end
