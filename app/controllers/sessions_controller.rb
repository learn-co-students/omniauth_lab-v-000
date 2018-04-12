class SessionsController < ApplicationController

  def create

    user = User.where(uid: request.env['omniauth.auth'][:uid]).first_or_create do |user|
      user.name = request.env['omniauth.auth'][:info][:name]
    end

    session[:user_id] = user.id

  end
end
