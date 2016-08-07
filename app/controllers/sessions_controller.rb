class SessionsController < ApplicationController

  def create
    #raise "IN CREATE METHOD NOW".inspect
    @auth = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @auth.id
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

end
