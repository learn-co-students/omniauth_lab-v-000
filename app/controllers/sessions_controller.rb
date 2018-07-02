class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(auth)
    session[:user_id] = user.id
    render 'welcome/home'
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private
  def auth
    request.env['omniauth.auth']
  end
end
