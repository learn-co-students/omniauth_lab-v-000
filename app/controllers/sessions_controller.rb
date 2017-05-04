class SessionsController < ApplicationController

  def create
    user = User.find_or_create_from_omniauth(auth)
    session[:user_id] = user.id
    @auth = auth
  end


  def auth
    request.env['omniauth.auth']
  end

end
