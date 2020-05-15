class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  def create
    session[:name] = auth['info']['name']
    session[:omniauth_data] = auth

    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
