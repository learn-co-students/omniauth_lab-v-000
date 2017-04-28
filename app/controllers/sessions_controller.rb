class SessionsController < ApplicationController

  def create
    user = User.find_or_create_by_omniauth(auth_hash)
    session[:user_id] = user.id
    redirect_to youreloggedin_path
  end

  def auth_hash
    request.env['omniauth.auth']
  end

  def loggedin
    @user = current_user
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path
  end

end
