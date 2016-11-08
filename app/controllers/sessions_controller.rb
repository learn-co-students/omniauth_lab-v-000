class SessionsController < ApplicationController
  def create
    if auth_hash = request.env["omniauth.auth"]
      user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = user.try(:id)
      @auth = request.env["omniauth.auth"]
    else
      user = User.find_or_create_by(name: params[:name])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.try(:id)

        redirect_to root_path
      else
        render root_path
      end
    end
  end
end
