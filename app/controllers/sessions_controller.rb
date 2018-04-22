class SessionsController < ApplicationController

  def create
   if  auth_hash = request.env['omniauth.auth']
      user = User.find_or_create_by(uid: auth_hash['uid']) do |u|
			u.name = auth_hash['info']['name']
			u.email = auth_hash['info']['email']
			u.image = auth_hash['info']['image']
		end
      session[:user_id] = user.id
      redirect_to root_path
    end
  end
end
