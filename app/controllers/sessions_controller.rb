class SessionsController < ApplicationController 

# finds user if it exists and logs the user in
 def create
   # @auth = auth
   user = User.find_or_create_by(uid: auth['uid']) do |u|
     u.name = auth['info']['name']
   end
   session[:user_id] = user.id
 end
 
 def auth
   request.env['omniauth.auth']
 end

end  