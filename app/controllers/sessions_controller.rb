class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |user|
      user.name = auth['info']['name']
    end

    session[:user_id] = @user.id
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end

#Upon acceptance, our app will use the retrieved data to either locate
#an existing user account or create a new one, and the user will then be logged in to our app