class EventAttendancesController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    @attendance = EventAttendance.new(attendee_id: @user.id, attended_event_id: params[:id])
    @attendance.save
    flash[:notice] = 'You are registered for the event!'
    redirect_to root_path
  end
end
