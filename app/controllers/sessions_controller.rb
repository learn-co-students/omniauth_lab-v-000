class SessionsController < ApplicationController

  def create
    @auth = auth
    user = User.where(
      uid: @auth[:uid]
    ).first_or_create(
      email: @auth[:info][:email],
      name: @auth[:info][:name]
    )
    log_in(user)
  end

  private

    def auth
      request.env["omniauth.auth"]
    end

    def log_in(user)
      session[:user_id] = user.id
    end

end
