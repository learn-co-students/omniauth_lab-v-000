class SessionsController < ApplicationController

  def create
    if @user = User.find_by(uid: auth['uid'])
      session[:user_id] = @user.id
    else
      @user = User.create(uid: auth['uid'], name: auth['info']['name'], email: auth['info']['email'])
      session[:user_id] = @user.id
    end

    redirect_to '/home'
  end

  private

    def auth
      request.env['omniauth.auth']
    end
end