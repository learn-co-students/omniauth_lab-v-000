class SessionsController < ApplicationController


  def create
    binding.pry
    if current_user
      redirect_to new_session_path
    end
  end
end
