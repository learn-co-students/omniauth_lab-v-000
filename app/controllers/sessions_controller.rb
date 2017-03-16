class SessionsController < ApplicationController
  
  def create 
    # raise request.env["omniauth.auth"].inspect
    if auth_hash = request.env["omniauth.auth"]
      user = User.find_or_create_by_omniauth(auth_hash)
      # raise auth_hash["uid"].inspect
      session[:user_id] = user.id
      redirect_to root_path 
    end
  end 

end
