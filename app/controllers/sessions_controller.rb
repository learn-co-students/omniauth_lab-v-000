class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by(:uid => auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.password = SecureRandom.hex

    end
    @auth = request.env['omniauth.auth']
    session[:user_id] = user.id
  end
  def auth
    request.env['omniauth.auth']
  end
end
