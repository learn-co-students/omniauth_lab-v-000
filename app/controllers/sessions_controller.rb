class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    session[:user_name] = user.name

    redirect_to root_path
  end
#  def create
#    user = User.find_or_create_by(:uid => auth['uid']) do |user|
#      user.name = auth['info']['name']
#    end
#    session[:user_id] = user.try(:id)
#  end

  def auth
    request.env['omniauth.auth']
  end

end
