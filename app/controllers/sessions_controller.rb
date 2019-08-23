class SessionsController < ApplicationController

  def create
     # binding.pry
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']

      #request.env this gives me a hash but i can't access the user's data

    end
    session[:user_id] = @user.id
    render 'welcome/home'
  end

  def auth
    request.env['omniauth.auth']
  end
end
