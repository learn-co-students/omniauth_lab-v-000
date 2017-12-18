class WelcomeController < ApplicationController

  def home
    #if someone is not logged in, they should see the Facebook link
    if session[:user_id]
     @user = User.find_by(id: session[:user_id])
    end
  end

end
