class ApplicationController < ActionController::Base
  layout 'application'

  before_action :set_username

  protected
    def set_username
      @username = cookies[:username]
    end

    def confirm_logged_in
      if session[:user_id].present?
        true
      else
        flash[:error] = 'Please log in!'
        redirect_to(login_path)
      end
    end
end
