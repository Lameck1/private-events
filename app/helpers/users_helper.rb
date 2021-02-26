module UsersHelper
  def user
    User.find(session[:user_id])
  end

  def display_past_events(user)
    if user.attended_events.past_events.empty?
      render partial: 'users/alert', locals: { text: 'NO PAST EVENTS' }
    else
      user.attended_events.past_events.each do |event|
        return render partial: 'layouts/event', locals: { event: event }
      end
    end
  end

  def display_upcoming_events(user)
    if user.attended_events.upcoming_events.empty?
      render partial: 'users/alert', locals: { text: 'NO UPCOMING EVENTS' }
    else
      user.attended_events.upcoming_events.each do |event|
        return render partial: 'layouts/event', locals: { event: event }
      end
    end
  end
end
