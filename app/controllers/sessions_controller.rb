class SessionsController < ApplicationController

    def new
    end 

    def create
        @user = User.find_or_create_by(name: auth_hash[:info][:name])
        byebug
            @user.uid = auth_hash[:uid]
        if @user.save
            session[:user_id] = @user.id
            render "welcome/home"
        end 
      end
    
      private
    
      def auth_hash
        request.env['omniauth.auth']
      end
end
