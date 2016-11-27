class SessionsController < ApplicationController

  def new
  end

  def create
    if request.env["omniauth.auth"]
      @auth = request.env["omniauth.auth"]
      @user = User.find_or_create_by(name: @auth["info"]["name"])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      redirect_to '/'
    end
  end

  def auth
    request.env["omniauth.auth"]
  end

  def home
    render 'home.html.erb'
  end

  def destroy
    session.delete :user_id
    render :goodbye
  end
end
