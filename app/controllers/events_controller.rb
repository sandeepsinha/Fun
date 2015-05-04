require 'pry'
class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(29)
  end

  def new
    @event = Event.new
  end

  def create
    # binding.pry
    @event = Event.new(event_params)
    if @event.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :description, :date ,:time ,:venue)
  end
end
