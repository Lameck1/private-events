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
    link_to user.username, user_path(session[:user_id]), class: 'nav-link text-light' if logged_in?
  end

  def display_logout
    return unless logged_in?

    link_to 'Log Out', logout_path, method: :delete, class: 'nav-link text-light bg-secondary mx-2 rounded-pill'
  end
end
