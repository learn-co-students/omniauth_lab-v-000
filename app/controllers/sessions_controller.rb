class SessionsController < ApplicationController

  def create
    @user = User.where(uid: auth[:uid]).first_or_create(uid: auth[:uid], email: auth[:info][:email], name: auth[:info][:name])
    session[:user_id] = @user.id
  end

private

  def auth
    request.env['omniauth.auth']
  end

end
