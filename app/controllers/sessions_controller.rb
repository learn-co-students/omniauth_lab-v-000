class SessionsController < ApplicationController
  def create
    #note that you find or create by - b/c if the user is signing up for the first time, you have to create the user FROM the session controller rather than the users
    #controller, where it might go if you routed directly from the signup page
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
    #looks like you're getting some info from the auth provider that you don't have in your db
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
  
    session[:user_id] = @user.id
  
    render 'welcome/home'
  end
  
  private
  
  def auth
    request.env['omniauth.auth']
  end
end