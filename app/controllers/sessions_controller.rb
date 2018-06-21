class SessionsController < ApplicationController
  def new
  end

  def create
    if auth = request.env['omniauth.auth']
      if user = User.find_by(uid: auth[:uid])
        session[:user_id] = user.id
        redirect_to root_path
      else
        user = User.create(name: auth[:info][:name], email: auth[:info][:email], uid: auth[:uid], password: SecureRandom.hex)
        session[:user_id] = user.id
        redirect_to root_path
      end
    else user = User.find_by(email: params[:email])
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path
      end
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
