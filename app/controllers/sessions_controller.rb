class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_by(:uid => auth['uid']) do |user|
      user.name = auth['info']['name']
    end
    session[:user_id] = @user.id
    redirect_to 'welcome/home'
  end

  def auth
    request.env['omniauth.auth']
  end

end
