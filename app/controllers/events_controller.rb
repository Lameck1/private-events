class EventsController < ApplicationController
  def index
    @past_events = Event.past_events
    @upcoming_events = Event.upcoming_events
  end

  def new
    @event = Event.new
    @user = User.find(session[:user_id])
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @user = User.find(session[:current_user_id])
    @event = @user.created_events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  private
    def event_params
      params.require(:event).permit(:title, :description, :location, :schedule, :creator_id)
    end
end
