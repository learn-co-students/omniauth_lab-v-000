class SessionsController < ApplicationController
  def create
    raise auth.inspect
  end

  private
    def auth
      request.env['omniauth.auth']
    end
end
