require 'pry'
class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by(:uid => auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end
    if user.save
      session[:user_id] = user.id
      @auth = auth
    else
      redirect_to '/'
    end
  end

  def auth
    request.env['omniauth.auth']
  end
end
