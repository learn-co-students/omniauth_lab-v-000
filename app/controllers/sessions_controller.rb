class SessionsController < ApplicationController
  def create
  	@auth = auth
  #	binding.pry
    user = User.find_or_create_by(:uid => auth['uid']) do |u|
    	u.name = auth['info']['name']
    end
   # binding.pry

    session[:user_id] = user.id
  end
 
  def auth
    request.env['omniauth.auth']
  end
end
