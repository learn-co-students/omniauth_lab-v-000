class SessionsController < ApplicationController
  def create
      auth_hash = request.env['omniauth.auth']
      user = User.find_or_create_by_omniauth(auth_hash)
      if user
        session[:user_id] = user.id
      end
  end

end
