class SessionsController < ApplicationController

  def create
    user = User.first_or_create(uid: auth['uid']) do |user|
      user.name = auth['info']['name']
    end
    session[:user_id] = user.id
  end

  def auth
    request.env['omniauth.auth']
  end
end
