class SessionsController < ApplicationController
  
  def create
    user = User.find_or_create_by(uid: auth['uid'], name: auth['info']['name'])
    session[:user_id] = user.id
  end

  def auth
  	request.env['omniauth.auth']
  end
end
