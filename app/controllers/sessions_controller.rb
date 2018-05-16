class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by(uid: github_data[:uid]) do |u|
      u.name = github_data["info"]["name"]
      u.email = github_data["info"]["email"]
    end

    session[:user_id] = @user.id

    redirect_to 'welcome#home'
  end

  private

  def github_data
    request.env["omniauth.auth"]
  end
end
