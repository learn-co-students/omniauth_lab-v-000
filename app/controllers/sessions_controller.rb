require 'pry'
class SessionsController < ApplicationController
  def create

    @user = User.find_or_create_by(uid: auth_uid['uid']) do |u|
      u.name = auth['name']
      u.image = auth['image']
      u.email = auth['email']
    end
    session[:user_id] = @user.id
  end

  private

  def auth_uid
    request.env['omniauth.auth']
  end

  def auth
    request.env['omniauth.auth']['info']
  end
end
