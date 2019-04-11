class SessionsController < ApplicationController

  def create
    @auth = request.env['omniauth.auth']
    @user = User.find_or_create_by(uid: @auth['uid']) do |u|
      u.name = @auth['info']['name']
    end

    session[:user_id] = @user.id

    render 'welcome/home'
  end
  
end
