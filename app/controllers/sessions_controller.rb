class SessionsController < ApplicationController 

    def create 
        # binding.pry 
         auth_hash = request.env["omniauth.auth"]
        @user = User.find_or_create_by(uid: auth_hash[:uid])
        # @user.email = auth_hash[:info][:email]
        @user.name = auth_hash[:info][:name]
        @user.save 
        session[:user_id] = @user.id

    end 
end 