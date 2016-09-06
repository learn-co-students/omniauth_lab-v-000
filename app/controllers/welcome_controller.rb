class WelcomeController < ApplicationController
  def home
    redirect_to profile_path if session[:user_id]
  end

  def profile
    binding.pry
    @user =
    if session[:user_id].present?
      @user = User.find_by(id: session[:user_id])
    else
      redirect_to root_path
    end
  end

end
