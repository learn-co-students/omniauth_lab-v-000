class SessionsController < ApplicationController

  def create
    user = User.where(name: request.env["omniauth.auth"]["info"]["name"]).first_or_create(uid: request.env["omniauth.auth"]["info"]["uid"])
    session[:user_id] = user.id
    redirect_to root_path
  end
end
