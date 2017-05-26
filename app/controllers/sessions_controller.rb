class SessionsController < ApplicationController
 def create
   user = User.first_or_create(:name => auth['info']['name']) do |u|
     u.email = auth['info']['email']
     u.password = SecureRandom.hex
   end
   session[:user_id] = user.id
   redirect_to hello_path
 end

 def auth
   request.env['omniauth.auth']
 end
 end
