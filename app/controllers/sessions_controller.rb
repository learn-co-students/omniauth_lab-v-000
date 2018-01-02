class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_or_create_by(:email => auth['email']) do |u|
      u.provider = auth['provider']
      u.uid = auth['uid']
      u.name = auth['info']['name']
    end
    
    session[:user_id] = @user.id

    redirect_to controller: 'welcome', action: 'home'    
  end

  def destroy

  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
