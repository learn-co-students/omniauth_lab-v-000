class SessionsController < ApplicationController
    def create
  	@auth = auth
  	# puts "in create"
  	user = User.find_or_create_by(:uid => auth[:uid]) do |u|
  		# puts "definitely won't work"

  		u.name = auth['info']['name']
  		u.email = auth['info']['email']
  	end
  	session[:user_id] = user.id
  end

  def auth
  	# puts "in auth"
  	request.env['omniauth.auth']
  end
end
