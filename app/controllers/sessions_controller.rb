class SessionsController < ApplicationController 
	def create 
		session.delete :user_id
		@auth = auth
		@user = User.find_by(uid: auth['uid'])
		if @user.nil?
		@user = User.create()
		@user.uid = auth['uid'] 
		@user.name = auth['info']['name'] 
		@user.email = auth['info']['email']
		@user.save
		session[:user_id] = @user.id
		else
			session[:user_id] = @user.id
		end 
	end 

	def auth 
		request.env['omniauth.auth']
	end 
end 
