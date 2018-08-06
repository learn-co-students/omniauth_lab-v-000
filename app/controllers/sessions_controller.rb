class SessionsController < ApplicationController

  def create

  end



private

  def auth
    request.env['omniauth.auth']
  end

end 