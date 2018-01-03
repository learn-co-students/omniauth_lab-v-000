class SessionsController < ApplicationController
  def new
  end

  def auth
    request.env["omniauth.auth"]
  end

  def create
    user = User.find_or_create_by(:uid => auth["uid"]) do |user|
      user.name = auth["info"]["name"]
    end 
    session[:user_id] = user.id 
  end

  # def create
  #   if auth_hash = request.env["omniauth.auth"]
  #     # binding.pry
  #     user = User.find_or_create_by_omniauth(auth_hash)
  #     session[:user_id] = user.id
  #     redirect_to root_path
  #   else
  #     user = User.find_by(:email => params[:email])
  #     if user && user.authenticate(params[:password])
  #       session[:user_id] = user.id 
  #       redirect_to root_path
  #     else
  #       render 'sessions/new'
  #     end 
  #   end
  # end

  def destroy
    reset_session
    redirect_to login_path
  end

end
