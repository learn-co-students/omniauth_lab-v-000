class SessionsController < ApplicationController

  def create
    @auth = request.env["omniauth.auth"]
    if user = User.find_by(:name => @auth["info"]["name"])
      session[:user_id] = user.id
    else
      user = User.create(
        :email => @auth["info"]["email"],
        :name => @auth["info"]["name"],
        :uid => @auth["uid"],
        :password => SecureRandom.hex
      )
      session[:user_id] = user.id
    end
  end
end
