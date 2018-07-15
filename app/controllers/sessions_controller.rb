class SessionsController < ApplicationController


  def create
    @user =  User.find_by_name_fb(auth)
    # binding.pry
    if @user
      set_session_and_redirect
    else
      @user = User.create_by_name_fb(auth)
      set_session_and_redirect
    end
  end

  private

    def auth
      auth = request.env['omniauth.auth']
    end

    def set_session_and_redirect
      session[:user_id] = @user.id
      redirect_to new_session_path
    end
end
