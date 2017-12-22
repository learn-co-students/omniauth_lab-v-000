class SessionsController  < ActionController::Base

  def create
    if auth_hash = request.env['omniauth.auth']

      user = User.find_or_create_by_omniauth(auth_hash)

      session[:user_id] = user.id
      auth_facebook_callback_path
    else
      redirect_to root_path
    end
  end
end
