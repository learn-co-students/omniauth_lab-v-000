class SessionsController < ApplicationController
  def create
    if auth_hash = request.env["omniauth.auth"]
      oauth_name = auth_hash["info"]["name"]
      oauth_uid = auth_hash["uid"]
      user = User.find_or_create_by(name: oauth_name, uid: oauth_uid)
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end
