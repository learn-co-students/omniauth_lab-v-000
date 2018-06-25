
class SessionsController < ApplicationController

  def create
    user = User.find_by(name: auth_hash["info"]["name"])
    if user.nil?
      user = User.new do |u|
        u.name = auth_hash["info"]["name"]
        u.email = auth_hash["info"]["email"]
        u.uid = auth_hash["uid"]
      end
      if user.valid?
        user.save
      else
        redirect_to root_path
      end
    end
    session[:user_id] = user.id
    @auth = auth_hash
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end
end
