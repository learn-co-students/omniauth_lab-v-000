class WelcomeController < ApplicationController
  def home
    @user = session[:user_id]
  end
end
