class SessionsController < ApplicationController

  def create
    if auth
      if user = User.find_by(uid: auth[:uid])
        session[:user_id] = user.id
      else
        user = User.new(uid: auth[:uid], name: auth[:info][:name])
        if user.save
          session[:user_id] = user.id

          # redirect_to root_path
        # else
          # raise user.errors.full_messages.inspect
        end
      end
      # else
    end
  end

  def auth
    request.env['omniauth.auth']
  end

  def destroy
    session.delete [:user_id]
  end
end