class WelcomeController < ApplicationController
  def home
    if session[:user_id]
      @user=User.find(session[:user-id])
    end
  end
end
