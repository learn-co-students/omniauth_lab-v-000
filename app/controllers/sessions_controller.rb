class SessionsController < ApplicationController
	def create
		if auth
			if @user = User.find_by(uid: auth[:uid])
				session[:user_id] = @user.id
				redirect_to :root, alert: 'success'
			else @user = User.create(uid: auth[:uid],name: auth[:info][:name])
				session[:user_id] = @user.id
				redirect_to :root, alert: 'success'
			end
		else
			# local database login flow
		end
	end

  def auth
    request.env['omniauth.auth']
  end
end
