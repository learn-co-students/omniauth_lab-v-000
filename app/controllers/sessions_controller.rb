class SessionsController < ApplicationController
  def create
    #raise "stop".inspect
    user = User.find_or_create_by(:uid => auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end
    session[:user_id] = user.id
  end

  def auth
    #binding.pry
    request.env['omniauth.auth']
  end
end
