class SessionsController < ApplicationController

  def create
    @user = User.from_omni(auth)
    session[:user_id] = @user.id
  end

  def auth
    request.env['omniauth.auth']
  end

end
