class SessionsController < ApplicationController

    def create 
        @user = User.find_or_create_by(uid: request.env["omniauth.auth"]["uid"]) do |u| 
            u.name = request.env["omniauth.auth"]["info"]["name"]
        end

        session[:user_id] = @user.id
    end
end
