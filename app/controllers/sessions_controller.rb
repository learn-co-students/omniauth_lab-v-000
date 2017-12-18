class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |user|
      user.name = auth['info']['name']
      user.image = auth['info']['image'] if auth['info']['image']
    end

    session[:user_id] = @user.id
    render 'sessions/create'
  end

  private
    def auth
      request.env['omniauth.auth']
    end
end