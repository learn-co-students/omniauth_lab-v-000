class SessionsController < ApplicationController
  def new
  end

  def create
    if auth
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth[:info][:name]
      end
      session[:user_id] = @user.id
      @auth = auth
      render :'sessions/create'
    else
      render :'welcome/home'  
    end
  end
end
