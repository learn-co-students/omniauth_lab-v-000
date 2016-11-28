class SessionsController < ApplicationController

  def create
    if auth_hash = request.env['omniauth.auth']
      user = User.find_or_create_by_omniauth(auth_hash)
      @user = user
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end
end
