class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_by(uid: auth[:uid]) do |x|
      x.name = auth[:info][:name]
      x.email = auth[:info][:email]
    end
    session[:user_id] = @user.id
  end

  private
  def auth
    request.env['omniauth.auth']
  end
end
