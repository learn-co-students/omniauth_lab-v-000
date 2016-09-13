class SessionsController < ApplicationController

  def create
    user = User.find_or_create_by(:uid => auth['uid']) do |user|
     user.name = auth['info']['name']
     user.email = auth['info']['email']
    end
    if user
      session[:user_id] = user.id
      redirect_to profile_path
    else
      redirect_to root_path
    end
  end

  def auth
    request.env['omniauth.auth']
  end

end
