class SessionsController < ApplicationController

  def create
    omni_hash = request.env["omniauth.auth"]
    user = User.find_or_create_by_omniauth(omni_hash)
    session[:user_id] = user.try(:id)
    redirect_to root_path
  end

end
