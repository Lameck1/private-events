class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    flash[:success] = 'Sign Up successful!'
    redirect_to(login_path)
  end

  def show
    @user = User.find(params[:id])
    @attended_events = @user.attended_events
    @created_events = @user.created_events
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
