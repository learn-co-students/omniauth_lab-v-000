class SessionsController < ApplicationController
  def create
    # If the user can be found by uid in auth it returns the user and stores it in the session
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
    end

    session[:user_id] = @user.id

    render 'welcome/home'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
