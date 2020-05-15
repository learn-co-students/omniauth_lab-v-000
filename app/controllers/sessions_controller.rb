class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  def create
    @name = auth['info']['name']
    session[:omniauth_data] = auth

    user = User.find_or_create_by(name:@name, uid:auth['uid'])
    session[:user_id] = user.id

    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
