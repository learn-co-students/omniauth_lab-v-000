class SessionsController < ApplicationController

  def create
    # binding.pry
    @auth = request.env['omniauth.auth']
    user = User.find_or_create_by(uid: @auth[:uid]) do |u|
        u.email = @auth[:info][:email]
        u.name = @auth[:info][:name]
    end

    session[:user_id] = user.id

  end

end
