class SessionsController < ApplicationController

   def new
   end

   def create
     if auth_hash = request.env["omniauth.auth"]
       user = User.find_or_create_by_omniauth(auth_hash)
       session[:user_id] = user.id
       redirect_to root_path
     else
       #Normal login with Username & Password
       user = user.find_by(:email => params[:email])
       if user && user.authenticate(params[:password])
         session[user_id] = user.id
         redirect_to root_path
       else
         render ‘sessions/new’
       end
     end
   end

   private

   def auth
     request.env['omniauth.auth']
   end

end
