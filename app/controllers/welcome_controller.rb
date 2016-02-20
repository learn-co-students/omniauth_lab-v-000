class WelcomeController < ApplicationController
  def home
  end

  def index
    @user = User.find_by(id: current_user)
  end  
end
