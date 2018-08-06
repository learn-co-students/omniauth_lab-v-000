# require 'securerandom'

class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      u.password = SecureRandom.hex
    end
    self.current_user = @user
    render 'welcome/home'
  end


  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def signed_in?
   !!current_user
  end

  helper_method :current_user, :signed_in?

    def current_user=(user)
      @current_user = user
      session[:user_id] = user.id
    end


private

  def auth_hash
    request.env['omniauth.auth']
  end

end
