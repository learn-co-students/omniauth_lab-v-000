class SessionsController < ApplicationController

  def create

    user = User.find_or_create_by(uid: auth['uid']) do |user|
      binding.pry
      user.email = auth['info']['email']
      user.name = auth['info']['name']
    end
    if User.exists?(user.uid)
      user
    else
      user.save!
      user
    end

    session[:user_id] = user.id
    render 'welcome/home'
    #
    # else
    #   user = User.find_by_email(params[:email])
    #   user && user.authenticate(params[:password])
    #   session[:user_id] = user.id
    #   redirect_to user_path(user.id)
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
