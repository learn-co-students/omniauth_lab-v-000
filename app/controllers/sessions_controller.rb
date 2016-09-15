
class SessionsController < ApplicationController
  def create
    @auth = auth
    user = User.find_or_create_by(uid: auth['uid'].to_i, name: auth['info']['name'])
    session[:user_id] = user.id
  end

  def auth
    request.env['omniauth.auth']
  end
end
