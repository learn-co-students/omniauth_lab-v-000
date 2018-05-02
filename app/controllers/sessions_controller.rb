class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.provider = auth['provider']
      u.email = auth['info']['email']
      u.name = auth['info']['name']
    end
 
    session[:user_id] = @user.id
 
    render 'welcome/home'
  end

   def auth
    request.env['omniauth.auth']
  end
end