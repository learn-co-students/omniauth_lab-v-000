class SessionsController < ApplicationController

  def new

  end

  def create
    if request.env['omniauth.auth']
      @user = User.find_or_create_by(name: request.env['omniauth.auth']['info'][:name])
      session[:user_id] = @user.id
      redirect_to :controller => :users, :action => 'create'
    else
      redirect_to root_path
    end

  end

  def destroy
    session.delete :user_id
  end


end
