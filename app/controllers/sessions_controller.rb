class SessionsController < ApplicationController
  def new
    render :layout => "login"
  end

  def create
    user = User.find_by(:username => params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render 'sessions/new'
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end
