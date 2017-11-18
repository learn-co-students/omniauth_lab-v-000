class SessionsController < ApplicationController
  def create
    @auth = request.env['omniauth.auth']
    @user = User.find_or_create_by_omniauth(@auth)
    session[:user_id] = @user.id
  end
end
