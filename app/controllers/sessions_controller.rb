class SessionsController < ApplicationController

  def create
    if auth.present?
      user = User.find_or_create_by_omniauth(auth)
      session[:user_id] = user.id
    end
    @auth = auth
  end

  private

    def auth
      request.env["omniauth.auth"]
    end
end
