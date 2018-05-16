class SessionsController < ApplicationController

  def create
    #byebug
    @user = User.first_or_create(uid: auth['uid'], name: auth['info']['name']) do |u|
      #u.name = auth['info']['name']
      #u.email = auth['info']['email']

    end

    session[:user_id] = @user.id

    render 'welcome/home'

  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
