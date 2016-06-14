class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_or_create_by(:uid => request.env['omniauth.auth']['uid']) do |u|
      u.name = request.env['omniauth.auth']['info']['name']
      u.email = request.env['omniauth.auth']['info']['email']
    end
    session[:user_id] = user.id
  end

  def destroy
  end
end
