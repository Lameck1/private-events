class AccessController < ApplicationController
  before_action :confirm_logged_in, except: %i[new create]

  def new; end

  def create
    user = User.find_by_username(params[:username])
    if user
      cookies[:username] = user.username
      session[:user_id] = user.id
      flash[:success] = 'Log in successful'
      redirect_to(root_path)
    else
      flash.now[:alert] = 'Invalid User!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Log out successful!'
    redirect_to(login_path)
  end
end
