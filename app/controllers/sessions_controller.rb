class SessionsController < ApplicationController


  def create
    if user = User.find_or_create_by(:uid => auth['uid'])
      byebug
      user.name = auth['info']['name']
        user.save
      session[:user_id] = user.try(:id)

    else

      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to hello_path
      else
        redirect_to root_path
      end
    end
  end

  def auth
    request.env['omniauth.auth']
  end
end
