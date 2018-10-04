class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
<<<<<<< HEAD
=======
      u.email = auth['info']['email']
      u.image = auth['info']['image']
>>>>>>> 9665d99accfb815ddee419bdc8f86da7c6ced984
    end

    session[:user_id] = @user.id

    render 'welcome/home'
  end

  def destroy

  end

<<<<<<< HEAD
  private

  def auth
    request.env['omniauth.auth']
  end

=======
>>>>>>> 9665d99accfb815ddee419bdc8f86da7c6ced984
end
