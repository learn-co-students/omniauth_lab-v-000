class SessionsController < ApplicationController
  
  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
    end
    #if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      render 'welcome/home'
    #else 
      #render 'sessions/new'
    #end
  end 
  
  # def destroy 
  #   session.delete :name
  #   redirect_to "/login"
  # end 

  private
  def auth
    request.env['omniauth.auth']
  end
  
end
