class SessionsController < ApplicationController

  def create
    if omni_hash = request.env["omniauth.auth"]
      user = User.find_or_create_by_omnihash(omni_hash)
      session[:user_id] = user.id
    end
  end

end
