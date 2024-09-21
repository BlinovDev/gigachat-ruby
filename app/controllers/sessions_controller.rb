class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    user = User.find_by(nickname: params[:session][:nickname])
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user, notice: 'Logged in successfully.'
    else
      flash.now[:alert] = 'Invalid email or password.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out successfully.'
  end
end
