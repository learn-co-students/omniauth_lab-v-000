class SessionsController < ApplicationController
  def new

  end

  def create
    #finds user if it exists and logs the user in
    #creates user if it doesnt exist in the db
    user = User.find_or_create_by(:uid => auth['uid']) do |user|
      user.name = auth['info']['name']
      #create the user correctly
    end
    session[:user_id] = user.try(:id)
    #session[:user_id] = @user.id
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
