class SessionsController < ApplicationController
  # def create
  #   request.env['omniauth.auth']
  # end

  def auth
    request.env['omniauth.auth']
  end
end