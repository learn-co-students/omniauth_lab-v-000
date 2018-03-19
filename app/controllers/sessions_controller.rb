class SessionsController < ApplicationController

  def create
    @user = User.from_oath(auth)

    session[:user_id] = @user.id

    render '/welcome/home'
  end

  def destroy
    session.delete :user_id

    redirect_to '/'
  end

  private
    def auth
      request.env['omniauth.auth']
    end
end
