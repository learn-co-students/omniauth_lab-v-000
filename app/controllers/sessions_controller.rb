class SessionsController < ApplicationController
  def create
    @auth = auth_hash
    @user = User.find_or_create_by_omniauth(@auth)
    # raise @user.inspect
    session[:user_id] = @user.id
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
