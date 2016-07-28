class SessionsController < ApplicationController
# Controller actions must route to a view or have their own view for each action
  def create
    user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end
    session[:user_id] = user.id
  end

  def auth
    @auth = request.env['omniauth.auth']
  end
end
