class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
# raise params.inspect
    @user = User.find(params[:id])
  end

end
