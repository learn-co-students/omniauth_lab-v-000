class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by_omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
  end
end
