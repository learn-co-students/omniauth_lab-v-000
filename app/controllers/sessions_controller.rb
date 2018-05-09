class SessionsController < ApplicationController
	helper_method :deserialize

	def create 

		if @auth = auth 
			@user = User.find_or_create_by_omniauth(auth)
		end 
		session[:user_id] = @user.id
	end 


	private 

		def auth
			request.env['omniauth.auth']
		end 


end
