class SessionsController < ApplicationController
  
  def create
  	if auth_hash = request.env['omniauth.auth']
  		user = User.find_or_create_omniauth(auth_hash)
  		session[:user_id] = user.id 
  	end
  end
end
