module UsersHelper
  def user
    User.find(session[:user_id])
  end

  def display_created_events(user, name, events)
    if user.created_events.empty?
      render partial: 'users/alert', locals: { text: 'NO EVENTS SO FAR' }
    else
      render partial: name, locals: { obj: events }
    end
  end

  def display_past_events(user, name, events)
    if user.attended_events.past_events.empty?
      render partial: 'users/alert', locals: { text: 'NO PAST EVENTS' }
    else
      render partial: name, locals: { obj: events }
    end
  end

  def display_upcoming_events(user, name, events)
    if user.attended_events.upcoming_events.empty?
      render partial: 'users/alert', locals: { text: 'NO UPCOMING EVENTS' }
    else
      render partial: name, locals: { obj: events }
    end
  end
end
