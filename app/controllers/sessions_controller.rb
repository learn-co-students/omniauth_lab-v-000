class SessionsController < ApplicationController
    def create
        # binding.pry
        user = User.find_or_create_by(uid: auth[:uid], name: auth[:info][:name])
        session[:user_id] = user.id
        redirect_to root_path
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
        flash[:notice] = "You have been logged out."
    end
        
    private

    def auth
    request.env['omniauth.auth']
    end

end
