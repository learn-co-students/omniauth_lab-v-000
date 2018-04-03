class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      # u.image = auth['info']['image']
    end

    session[:user_id] = @user.id

    render 'welcome/home'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
# class SessionsController < ApplicationController
#
#     def create
#         if auth_hash = request.env["omniauth.auth"]
#             user = User.find_or_create_by_omniauth(auth_hash)
#             session[:user_id] = user.id
#
#             redirect_to root_path
#         else
#             #regular login flow
#         end
#     end
# end
