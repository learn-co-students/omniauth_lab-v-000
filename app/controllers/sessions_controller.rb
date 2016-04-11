class SessionsController < ApplicationController
  def new
  end

  def create
    @user=User.find_or_create_by(uid: user_hash['id'])
    @user.email = user_info["email"]
    @user.name = user_info["name"]
    @user.save
    session[:id]=@user.id
    render "authenticated"

  end

  def destroy
  end

  def user_hash
    request.env['omniauth.auth']
  end

  def user_info
    user_hash['info']
  end

  private
    def user_params
      params.require(:user).permit(:email, :name, :image)

    end
end
