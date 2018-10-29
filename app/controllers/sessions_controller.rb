require 'pry'
class SessionsController < ApplicationController
  def create
    #binding.pry
    if auth_hash = request.env['omniauth.auth']
      user = User.find_by(uid: auth_hash[:uid])
      if !user.nil?
        session[:user_id] = user.id
        redirect_to root_path
      else
        user = User.create(uid: auth_hash[:uid], name: auth_hash[:info][:name])
        session[:user_id] = user.id
        redirect_to root_path
      end
    end
  end
end
