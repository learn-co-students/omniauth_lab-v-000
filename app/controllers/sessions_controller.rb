class SessionsController < ApplicationController

  def create
    @user =  User.find_or_create_by(name: auth_hash[:info][:name] , uid: auth_hash[:uid] ) do |user|
        user.name = auth_hash[:info][:name]
        user.email = auth_hash[:info][:email]
        user.uid = auth_hash[:uid]
      end
      session[:user_id]= @user.id
  end


  private

  def auth_hash
    request.env['omniauth.auth']
  end


end
