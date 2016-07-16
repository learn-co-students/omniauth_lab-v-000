class UserController < ApplicationController

  def create
    user = User.create(user_params)
    redirect_to 'sessions/create'
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_digest, :uid)
  end
end
