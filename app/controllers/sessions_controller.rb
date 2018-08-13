class SessionsController < ApplicationController

  def create
   if auth_hash = request.env["omniauth.auth"]
     oauth_email = request.env["omniauth.auth"]["info"]["email"]
     oauth_name = request.env["omniauth.auth"]["info"]["name"]
     binding.pry
     if user = User.find_by(:email => oauth_email)
       session[:user_id] = user.id
     else
       user = User.create(:email => oauth_email, :name => oauth_name)
       oauth_email
       session[:user_id] = user.id
     end
   else
     user = User.find_by(:email => params[:email])
     if user && user.authenticate(params[:password])
       session[:user_id] == user.id
       redirect to root_path
     else
       render 'sessions/new'
     end
    end
  end


 private

 def auth
   request.env['omniauth.auth']
 end
end
