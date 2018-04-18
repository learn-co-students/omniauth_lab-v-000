class SessionsController < ApplicationController
  def create
    # ***i
    if @auth= request.env["omniauth.auth"]
      @user = User.find_or_create_by(@auth) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
      end
      session[:user_id] = @user.id
    end
  end



end
