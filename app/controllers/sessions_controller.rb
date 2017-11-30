class SessionsController < ApplicationController

  def create
    user = User.find_or_create_by(uid: auth[:uid])
    user.update(name: auth[:info][:name], email: auth[:info][:email])
    session[:user_id] = user.try(:id)
  end

  def auth
    request.env['omniauth.auth']
  end
end


# <User id: 1, name: nil, email: nil, image: nil, uid: 1234567

# request.env['omniauth.auth'].inspect
#       => {"provider"=>"facebook",
#           "uid"=>"1234567",
#           "info"=>  {
#                     "email"=>"blake@flatironschool.com",
#                     "name"=>"Blake Johnson"
#                     }}
