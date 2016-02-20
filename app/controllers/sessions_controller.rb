require 'pry'
class SessionsController < ApplicationController

  def create
    binding.pry
    user = User.find_or_create_by(uid: auth[:uid]) do |u|
      u.name = auth[:info][:name]
      u.email = auth[:info][:email]
    end
    session[:user_id] = user.id
    redirect_to welcome_you_path  
  end 

  def auth 
    request.env['omniauth.auth']
  end 
end