class SessionsController < ApplicationController
  def create
  	@user = User.find_or_create_from_auth_hash(auth_hash)
  	# byebug
  	session[:user_id] = @user.id
  	# byebug
  	redirect_to '/'
  end

  def logout
  	session
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
