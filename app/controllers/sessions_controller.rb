class SessionsController < ApplicationController
  def create

      @user = User.find_or_create_by(:name => auth[:info][:name], uid: auth['uid'])
      session[:user_id] = @user.id
      #binding.pry

  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
