class SessionsController < ApplicationController

    def create 
        if auth_hash = request.env["omniauth.auth"]
            raise auth_hash.inspect
        else 
            user = User.find_by(:email => params[:email])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id 

                redirect_to root_path 
            else 
                render 'sessions/new'
            end
        end
    end
end
