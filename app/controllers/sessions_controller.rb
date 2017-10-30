class SessionsController < ApplicationController
  def create
  	user = User.find_or_create_by(:uid => auth["uid"]) do |u|
  		u.email = auth["info"]["email"]
  		u.image = auth["info"]["image"]
  		u.name = auth["info"]["name"]
  	end
  	session[:user_id] = user.id
  end

  private	
  def auth
  	request.env["omniauth.auth"]
  end
end
