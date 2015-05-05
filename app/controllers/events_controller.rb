require 'pry'
class EventsController < ApplicationController
  def list
    @events = Event.all
  end

  def show
    @event = Event.find(params[:format])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to action:'list'
    else
      render 'new'
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :description, :date ,:time ,:venue)
  end
end
