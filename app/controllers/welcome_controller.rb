#require 'pry'
class WelcomeController < ApplicationController
  def home
    #binding.pry
    if session[:user_id]
      @user = User.find_or_create_by(id: session[:user_id])
    end
  end
end
