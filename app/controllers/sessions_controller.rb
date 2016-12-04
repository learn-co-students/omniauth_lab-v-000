class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env["omniauth.auth"]
    @user = User.find_or_create_by(:email => auth_hash[:email]) do |u|
      u.uid = auth_hash[:uid]
      u.name = auth_hash[:info][:name]
      u.provider = auth_hash[:provider]
    end
    session[:user_id] = @user.id
  end
end
