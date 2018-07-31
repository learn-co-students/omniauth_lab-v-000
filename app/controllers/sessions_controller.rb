class SessionsController < ApplicationController
  def create
    @user = User.from_omniauth(auth)
    session[:user_id] = @user.id
    render 'welcome/home'
  end

  private
    def auth
      request.env['omniauth.auth']
    end
end
