class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |new_user|
      new_user.name = auth['info']['name']
      new_user.email = auth['info']['email']
      new_user.image = auth['info']['image']
    end
    session[:user_id] = @user.id
    
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end

