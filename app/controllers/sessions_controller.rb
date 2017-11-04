class SessionsController < ApplicationController
  def new
  end

  def create
    @auth = request.env['omniauth.auth']
    @user = User.find_or_create_by(uid: @auth[:uid]) do |u|
      u.update_attributes(@auth[:info])
      # u.name = @auth[:info][:name]
      # u.image = @auth[:info][:image]
      # u.email = @auth[:info][:email]
    end

    session[:user_id] = @user.id
  end
end
