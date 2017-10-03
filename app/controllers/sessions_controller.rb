class SessionsController < ApplicationController

  # def create
  #   user = User.from_omniauth(env["omniauth.auth"])
  #   session[:user_id] = user.id
  #   redirect_to root_url
    
  # end


  #   private 
  #   def auth_hash
  #     request.env['omniauth.auth']
  #   end

  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
    end
 
    session[:user_id] = @user.id
 
    render 'welcome/home'
  end
 
  private
 
  def auth
    request.env['omniauth.auth']
  end
end
