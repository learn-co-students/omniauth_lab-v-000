class SessionsController < ApplicationController
  def create
    @auth = request.env["omniauth.auth"]
    @user = User.first_or_create(email: @auth[:info][:email]) do |u|
      u.uid = @auth[:uid]
      u.name = @auth[:info][:name]
      u.provider = @auth[:provider]
    end
    session[:user_id] = @user.id
  end
end
