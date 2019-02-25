class SessionsController < ApplicationController

  def create

    user = User.find_or_create_by(:uid => request.env['omniauth.auth']['uid'])
    user.name = request.env['omniauth.auth']['info']['name']
    user.save
    session[:user_id] = user[:id]

  end

end
