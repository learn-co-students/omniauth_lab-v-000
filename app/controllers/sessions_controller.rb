class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by(uid: auth['uid'].to_i) do |u|
      u.name = auth['info']['name']
      u.uid = auth['uid']
    end
    session[:user_id] = @user.id
    render 'welcome/home'
  end

  def auth
    request.env['omniauth.auth']
  end
end
