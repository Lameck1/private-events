module ApplicationHelper
  def error_messages_for(object)
    render(partial: 'layouts/error_messages', locals: { object: object })
  end

  def logged_in?
    session[:user_id] != nil
  end

  def confirm_logged_in
    return if logged_in?

    flash[:notice] = 'Please log in!'
    redirect_to(login_path)
  end

  def display_login
    link_to('Login', login_path, class: 'nav-link text-light bg-secondary mx-2 rounded-pill') unless logged_in?
  end

  def display_sign_up
    link_to('Sign Up', new_user_path, class: 'nav-link text-light bg-secondary mx-2 rounded-pill') unless logged_in?
  end

  def display_username
    return unless logged_in?
    link_to user.username, user_path(session[:user_id]), class: 'nav-link text-light'
  end

  def display_logout
    return unless logged_in?

    link_to 'Log Out', logout_path, method: :delete, class: 'nav-link text-light bg-secondary mx-2 rounded-pill'
  end

  def host?(event)
    event.creator.id == session[:user_id]
  end

  def user_going?(event)
    user = User.find_by_id(session[:user_id])
    event.attendees.include?(user)
  end

  def display_host_info(event)
    render partial: 'users/alert', locals: { text: 'You are the host!' } if host?(event)
  end

  def display_going_button(event)
    return unless event.creator_id != session[:user_id] and event.schedule >= Date.today and !user_going?(event)

    (link_to 'Attend', event_attendances_path(id: event.id), class: 'btn btn-primary my-2',
                                                             method: :post).to_s.html_safe
  end

  def display_going_msg(event)
    return unless event.creator_id != session[:user_id] and event.schedule >= Date.today and user_going?(event)

    render partial: 'users/alert', locals: { text: 'You are a going to this event!' }
  end
end
