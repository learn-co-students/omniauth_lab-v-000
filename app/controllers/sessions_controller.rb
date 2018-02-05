class SessionsController < ApplicationController
  def create
    if @auth = request.env["omniauth.auth"]
      user = User.find_or_create_by(:uid => @auth["uid"]) do |user|
        user.name = @auth["info"]["name"]
        user.image = @auth["info"]["image"]
      end

      session[:user_id] = user[:id]
    end
  end
end
