class SessionsController < ApplicationController
  def create

    @auth = request.env['omniauth.auth']

    if @auth
       @user = User.find_or_create_by(uid: @auth['uid']) do |u|
        u.provider = @auth['provider']
        u.name = @auth['info']['name']
        u.email = @auth['info']['email']
      end
      session[:user_id] = @user.id
      redirect_to 'welcome/home'
    else

    end


  end

end
