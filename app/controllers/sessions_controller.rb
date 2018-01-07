class SessionsController < ApplicationController
  
  def create
    if auth_hash = request.env["omniauth.auth"]  
      user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = user.id 
      redirect_to 'sessions/create'
    else
      raise "User !auth_hash".inspect
      redirect_to root_route  
    end
  end

  def destroy
    reset_session
    redirect_to root_path

  end
end
