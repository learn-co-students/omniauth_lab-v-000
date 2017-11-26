class SessionsController < ApplicationController
  def create
  	@user = User.find_or_create_from_auth_hash(auth_hash)
  	current_user = @user.uid
  	redirect_to '/'
  end

  def logout
  	session.delete
  	redirect_to root_path
  end

  private

  def auth_hash
  	request.env['omniauth.auth']
  end

  def current_user
  	session[:user_id]
  end

end
