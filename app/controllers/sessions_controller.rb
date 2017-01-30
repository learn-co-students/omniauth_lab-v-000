class SessionsController < ApplicationController

	def create
		@auth = request.env['omniauth.auth']
		user = User.find_or_create_by(uid: @auth['uid']) do |u|
			u.name = @auth['info']['name']
      		# u.surname = auth['info']['last_name']
      		# u.img = auth['info']['image']
      		# u.fb_url = auth['extra']['raw_info']['link']
      		# u.location = auth['info']['location']
      		# u.fb_id = auth['uid']
      		# u.provider = auth['provider']
      		# u.email = auth['extra']['raw_info']['email']
		end
		session[:user_id] = user.id
	end


end