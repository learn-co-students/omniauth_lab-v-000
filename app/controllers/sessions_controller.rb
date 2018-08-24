class SessionsController < ApplicationController
  def create
    auth_hash = request.env["omniauth.auth"]["info"]
    # {"email"=>"blake@flatironschool.com", "name"=>"Blake Johnson"}
    user = User.find_or_create_by(name: auth_hash["name"])
    session[:user_id] = user.id

    redirect_to root_path



  end
end
