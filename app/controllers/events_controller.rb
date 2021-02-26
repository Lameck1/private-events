class EventsController < ApplicationController
  before_action :confirm_logged_in, only: %i[new create]

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
    @user = User.find(session[:user_id])
    @event = @user.created_events.build(event_params)
    if @event.save
      flash[:notice] = 'Event saved!'
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
