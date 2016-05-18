class SessionsController < ApplicationController

  def create
    user = User.find_or_create_by(:uid => auth['uid'])
    user.name = auth['info']['name']
    user.email = auth['info']['email']
    user.save
    session[:user_id] = user.id
    redirect_to root_path
  end

  def auth
    request.env['omniauth.auth']
  end

end
