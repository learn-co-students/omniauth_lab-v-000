class SessionsController < ApplicationController

    def create
        user = User.get_by_omniauth(request.env['omniauth.auth'])
        session[:user_id] = user.id
    end

end
