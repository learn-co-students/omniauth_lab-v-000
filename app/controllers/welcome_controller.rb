class WelcomeController < ApplicationController

  def home
    if session[:user_id]
      @auth = User.find(session[:user_id])
    end
  end

end
