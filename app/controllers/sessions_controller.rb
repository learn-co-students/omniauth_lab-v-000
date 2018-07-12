class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_by(name: request.env['omniauth.auth'][:info][:name], uid: request.env['omniauth.auth'][:uid])
    if @user
      session[:user_id] = @user.id
      
      redirect_to root_path
    end
  end
end
