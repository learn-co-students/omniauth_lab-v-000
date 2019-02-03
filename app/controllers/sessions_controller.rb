class SessionsController < ApplicationController

  def new
  end

  def create
  @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
      end
      session[:user_id] = @user.id
      redirect_to root_path
    end

    private
    def auth
    request.env['omniauth.auth']
  end

  #def create
    #if auth_hash = request.env["omniauth.auth"]
    #  user = User.find_or_create_by_omniauth(auth_hash)
    #  session[:user_id] = user.id

    #  redirect_to root_path
  #  else
    #  user = User.find_by(:email => params[:email])
      #if user
      #  session[:user_id] = user.id

      #  redirect_to root_path
    #  else
      #  render 'sessions/new'
      #end
  #  end
#  end

end
