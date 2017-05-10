class SessionsController < ApplicationController
  def create
  	if auth
			@user = User.find_or_create_by_omniauth(auth)
			session[:user_id] = @user.try(:id)
			redirect_to root_path
		else
			@user = User.find_by(:email => params[:email])
			if @user && @user.authenticate(params[:password])
				session[:user_id] = @user.try(:id)
				redirect_to root_path
			else
				render 'sessions/new'
			end
		end
  end

  def auth
  	request.env["omniauth.auth"]
  end

end
