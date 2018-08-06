require 'pry'
class SessionsController < ApplicationController

  def create
    if auth_hash = request.env["omniauth.auth"]
      @user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = @user.id
      render 'welcome/home'
    else
      # normal login - look up params user info in model and do user.authenticate
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
